import hashlib, uuid, time
import settings
from mod_python import Cookie, apache

def _get_secret():
    return settings.csrf_secret

def _message_contents():
    return settings.csrf_secret_contents

def _generate_csrf_cookie():
    cookie = Cookie.SignedCookie(settings.csrf_cookie_name,_message_contents(),_get_secret())
    cookie.expires = time.time() + 300 # 5 minutes
    return cookie

def _add_csrf_cookie_if_needed(req):
    signed_cookies = Cookie.get_cookies(req, Cookie.SignedCookie, secret=_get_secret())
    cookie = signed_cookies.get(settings.csrf_cookie_name, None)
    if cookie:
        # make sure we aren't altered
        if type(cookie) is Cookie.SignedCookie and cookie.value == _message_contents():
            return
    Cookie.add_cookie(req, _generate_csrf_cookie())

def _check_csrf(req):
    signed_cookies = Cookie.get_cookies(req, Cookie.SignedCookie, secret=_get_secret())
    cookie = signed_cookies.get(settings.csrf_cookie_name, None)
    if cookie:
        # make sure we aren't altered
        if type(cookie) is not Cookie.SignedCookie or cookie.value != _message_contents():
            raise apache.SERVER_RETURN, apache.HTTP_NOT_ACCEPTABLE
    else:
        return False
    return True
