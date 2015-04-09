#!/usr/bin/python
#sms_5c.py
# nagios notification method via sms, with conditional notification number
# example: only send first 3 notification: 0 2
import sys, os
import requests

def notification_tmpl():
   TMPL_SERVICE = '''{0[NOTIFY_WHAT]}: {0[NOTIFY_SERVICESTATE]}
SERVICE_DESCRIPTION: {0[NOTIFY_SERVICEDESC]}
SERVICEOUTPUT: {0[NOTIFY_SERVICEOUTPUT]}
SERVICE_SLA: {0[NOTIFY_HOSTADDRESS]}
HOSTNAME: {0[NOTIFY_HOSTNAME]}
HOSTADDRESS: {0[NOTIFY_HOSTADDRESS]}'''.format(os.environ)

   TMPL_HOST = '''{0[NOTIFY_WHAT]}: {0[NOTIFY_HOSTSTATE]}
HOSTNAME: {0[NOTIFY_HOSTNAME]}
HOSTADDRESS: {0[NOTIFY_HOSTADDRESS]}
HOSTALIAS: {0[NOTIFY_HOSTALIAS]}
HOSTOUTPUT: {0[NOTIFY_HOSTOUTPUT]}
HOST_SLA: {0[NOTIFY_HOST_SL]}'''.format(os.environ)

   if os.environ['NOTIFY_WHAT'] == 'SERVICE':
       return TMPL_SERVICE
   elif os.environ['NOTIFY_WHAT'] == 'HOST':
       return TMPL_HOST

def notify():
    _from = int(os.environ['NOTIFY_PARAMETER_1'])
    _to = int(os.environ['NOTIFY_PARAMETER_2'])
    notification_range = range(_from, _to)

    if os.environ['NOTIFY_WHAT'] == 'HOST':
        notification_number = int(os.environ['NOTIFY_HOSTNOTIFICATIONNUMBER'])
    elif os.environ['NOTIFY_WHAT'] == 'SERVICE':
        notification_number = int(os.environ['NOTIFY_SERVICENOTIFICATIONNUMBER'])

    if notification_number in notification_range:
        print "OK, notification number(%s) is in notification range(%s)" % (notification_number, notification_range)
        make_request(url, username, password, apikey, receiver, content)
    else:
        print "WARN, notification number(%s) is not in notification range(%s)" % (notification_number, notification_range)

def make_request(url, username, password, token, receiver, content):
    payload ={}
    payload['username'] = username
    payload['password'] = password
    payload['apikey'] = apikey
    payload['receiver'] = receiver
    payload['mobile'] = receiver
    payload['content'] = content

    response = requests.post(url, data=payload)
    print "reponse.url: %s" % response.url
    print "send_data: %s" % content
    print "reponse.result: %s" % response.text

###############################################################
# do notify action
###############################################################
url = 'http://m.5c.com.cn/api/send/?'
username = 'hdtr'
password = 'Tianren.SMSabcZ'
apikey = '8d683e752ec57d1bf38f46ca6c562b19'
receiver = os.environ['NOTIFY_CONTACTPAGER']
content = notification_tmpl()
notify()
