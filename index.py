from csrf import _add_csrf_cookie_if_needed, _check_csrf
import simplejson, urllib
from mod_python import Cookie, apache
import smtplib, string, cgi, os
import bitcoinrpc, settings
from recaptcha.client import captcha

def _current_btc_exchange_rate():
    json = simplejson.load(urllib.urlopen("https://mtgox.com/api/0/data/ticker.php"))
    #        {"ticker":{"high":4.52,"low":4.21311,"avg":4.381094156,"vwap":4.39066869,"vol":60774,"last_all":4.38268,"last_local":4.38268,"last":4.38268,"buy":4.34405,"sell":4.38268}}
    return json['ticker']['vwap']

def _sendmail(message,from_address):
    body = string.join((
        "From: %s" % from_address,
        "To: %s" % settings.mail_to,
        "Subject: %s" % settings.mail_subject ,
        "",
        cgi.escape(message).encode('ascii', 'xmlcharrefreplace')
        ), "\r\n")
    server = smtplib.SMTP(settings.mail_host)
    if settings.mail_user is not None:
        server.login(settings.mail_user, settings.mail_pass)
    server.sendmail(from_address, [settings.mail_to], body)
    server.quit()

def _template(file, vars=None):
    cp = os.path.dirname(os.path.abspath( __file__ ))
    return open(cp+'/{0}.tpl'.format(file), 'r').read() % vars

def index(req):
    _add_csrf_cookie_if_needed(req)
    return _template('index', {'exchange': _current_btc_exchange_rate()})

def exchange(req):
    return _current_btc_exchange_rate()

def pay(req):
    if req.method != 'POST':
        raise apache.SERVER_RETURN, apache.HTTP_BAD_REQUEST
    if not _check_csrf(req):
        return 'Bad CSRF token'
    response = captcha.submit(
        req.form['recaptcha_challenge_field'],
        req.form['recaptcha_response_field'],
        'YOUR RECAPTCHA PRIVATE KEY',
        req.get_remote_host(apache.REMOTE_NOLOOKUP),
    )
    if not response.is_valid:
        return 'Bad reCaptcha code'
    conn = bitcoinrpc.connect_to_remote(settings.rpc_user,settings.rpc_pass,settings.rpc_host,settings.rpc_port)
    amt = (20 * int(req.form['heads'])) / _current_btc_exchange_rate()
    pt = conn.getnewaddress()
    _sendmail("%(name)s will be sending %(amount)d coins to %(pay_to)s for attendees:\n%(attendees)s" % {'name': req.form['name'], 'amount': amt, 'pay_to': pt, 'attendees': req.form['attendees']}, req.form['email'])
    return _template('pay', {'exchange': _current_btc_exchange_rate(), 'address': pt, 'amt': amt})
