<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>Prepay for LAN69 using Bitcoins!</title>
    <style type="text/css" media="all">
        body, div, h1, form, fieldset, input, textarea {
            margin: 0; padding: 0; border: 0; outline: none;
        }

        html {
            height: 100%%;
        }

        body {
            background: #728eaa;
            background: -moz-linear-gradient(top, #25303C 0%%, #728EAA 100%%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%%,#25303C), color-stop(100%%,#728EAA)); /* webkit */
            font-family: sans-serif;
        }

        #contact {
            width: 430px; margin: 60px auto; padding: 60px 30px;
            background: #c9d0de; border: 1px solid #e1e1e1;
            -moz-box-shadow: 0px 0px 8px #444;
            -webkit-box-shadow: 0px 0px 8px #444;
        }

        h1 {
            font-size: 35px; color: #445668; text-transform: uppercase;
            text-align: center; margin: 0 0 35px 0; text-shadow: 0px 1px 0px #f2f2f2;
        }

        label {
            float: left; clear: left; margin: 11px 20px 0 0; width: 95px;
            text-align: right; font-size: 16px; color: #445668;
            text-transform: uppercase; text-shadow: 0px 1px 0px #f2f2f2;
        }

        input {
            width: 260px; height: 35px; padding: 5px 20px 0px 20px; margin: 0 0 20px 0;
            background: #5E768D;
            background: -moz-linear-gradient(top, #546A7F 0%%, #5E768D 20%%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%%,#546A7F), color-stop(20%%,#5E768D)); /* webkit */
            border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
            -moz-box-shadow: 0px 1px 0px #f2f2f2;-webkit-box-shadow: 0px 1px 0px #f2f2f2;
            font-family: sans-serif; font-size: 16px; color: #f2f2f2; text-transform: uppercase; text-shadow: 0px -1px 0px #334f71;
        }

        select {
            background: #5E768D;
            width: 268px;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            height: 34px;
            margin: 0 0 20px 0;
            border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
            -moz-box-shadow: 0px 1px 0px #f2f2f2;-webkit-box-shadow: 0px 1px 0px #f2f2f2;
            font-family: sans-serif; font-size: 16px; color: #f2f2f2; text-transform: uppercase; text-shadow: 0px -1px 0px #334f71;
        }

        input::-webkit-input-placeholder, select::-webkit-input-placeholder  {
            color: #a1b2c3; text-shadow: 0px -1px 0px #38506b;
        }
        input:-moz-placeholder, select::-moz-placeholder {
            color: #a1b2c3; text-shadow: 0px -1px 0px #38506b;
        }

        textarea {
            width: 260px; height: 170px; padding: 12px 20px 0px 20px; margin: 0 0 20px 0;
            background: #5E768D;
            background: -moz-linear-gradient(top, #546A7F 0%%, #5E768D 20%%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%%,#546A7F), color-stop(20%%,#5E768D)); /* webkit */
            border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
            -moz-box-shadow: 0px 1px 0px #f2f2f2;-webkit-box-shadow: 0px 1px 0px #f2f2f2;
            font-family: sans-serif; font-size: 16px; color: #f2f2f2; text-transform: uppercase; text-shadow: 0px -1px 0px #334f71;
        }
        textarea::-webkit-input-placeholder  {
            color: #a1b2c3; text-shadow: 0px -1px 0px #38506b;
        }
        textarea:-moz-placeholder {
            color: #a1b2c3; text-shadow: 0px -1px 0px #38506b;
        }

        input:focus, textarea:focus {
            background: #728eaa;
            background: -moz-linear-gradient(top, #668099 0%%, #728eaa 20%%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%%,#668099), color-stop(20%%,#728eaa)); /* webkit */
        }

        input[type=submit] {
            width: 185px; height: 52px; float: right; padding: 10px 15px; margin: 0 15px 0 0;
            -moz-box-shadow: 0px 0px 5px #999;-webkit-box-shadow: 0px 0px 5px #999;
            border: 1px solid #556f8c;
            background: -moz-linear-gradient(top, #718DA9 0%%, #415D79 100%%); /* firefox */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%%,#718DA9), color-stop(100%%,#415D79)); /* webkit */
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="contact">
    <h1>Thank You!</h1>
    Thank you for confirming your attendance and paying with BitCoins.  Your seat(s) will be available as soon as you make
    payment of <strong>%(amt)f BTC</strong> to the following address:
    <h3>%(address)s</h3>
    Thank you once again for pre-paying and we'll see you at the LAN!
    <br/>

    <br/>
    <div style="font-size: smaller; text-align: center;">Costs will be calculated against the current BTC exchange rate of <em>%(exchange)f</em></div>
</div>


</body>
</html>