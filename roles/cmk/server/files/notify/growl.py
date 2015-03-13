#!/usr/bin/python
# Send Notification via Growl
# -*- encoding: utf-8; py-indent-offset: 4 -*-
# +------------------------------------------------------------------+
# |             ____ _               _        __  __ _  __           |
# |            / ___| |__   ___  ___| | __   |  \/  | |/ /           |
# |           | |   | '_ \ / _ \/ __| |/ /   | |\/| | ' /            |
# |           | |___| | | |  __/ (__|   <    | |  | | . \            |
# |            \____|_| |_|\___|\___|_|\_\___|_|  |_|_|\_\           |
# |                                                                  |
# | Copyright Mathias Kettner 2013             mk@mathias-kettner.de |
# +------------------------------------------------------------------+
#
# This file is part of Check_MK.
# The official homepage is at http://mathias-kettner.de/check_mk.
#
# check_mk is free software;  you can redistribute it and/or modify it
# under the  terms of the  GNU General Public License  as published by
# the Free Software Foundation in version 2.  check_mk is  distributed
# in the hope that it will be useful, but WITHOUT ANY WARRANTY;  with-
# out even the implied warranty of  MERCHANTABILITY  or  FITNESS FOR A
# PARTICULAR PURPOSE. See the  GNU General Public License for more de-
# ails.  You should have  received  a copy of the  GNU  General Public
# License along with GNU Make; see the file  COPYING.  If  not,  write
# to the Free Software Foundation, Inc., 51 Franklin St,  Fifth Floor,
# Boston, MA 02110-1301 USA.

# GNTP uses the standard Python logging
import os, sys
import logging
logging.basicConfig(level=logging.INFO)

import gntp.notifier

growl_host = os.environ['NOTIFY_PARAMETER_1']
growl_password = os.environ['NOTIFY_PARAMETER_2']
if not growl_host:
    sys.exit("growl_host not setting")
elif not growl_password:
    sys.exit("growl_password not setting")
# Simple "fire and forget" notification
#gntp.notifier.mini("Here's a quick message")

# More complete example
growl = gntp.notifier.GrowlNotifier(
    applicationName = 'nagios_%s' % os.environ['NOTIFY_OMD_SITE'],
    notifications = ["ALL", "OK", "WARN", "CRIT", "UNKNOWN"],
    defaultNotifications = ["OK","WARN", "CRIT", "UNKNOWN"],
    hostname = growl_host, # Defaults to localhost
    password = growl_password # Defaults to a blank password
)
growl.register()

# Send one message
# Host message
msg = {}
msg['HOST'] = '''
State:    {0[NOTIFY_LASTHOSTSTATE]} -> {0[NOTIFY_HOSTSTATE]} ({0[NOTIFY_NOTIFICATIONTYPE]})
Command:  {0[NOTIFY_HOSTCHECKCOMMAND]}
Output:   {0[NOTIFY_HOSTOUTPUT]}
Perfdata: {0[NOTIFY_HOSTPERFDATA]}
{0[NOTIFY_LONGHOSTOUTPUT]}'''.format(os.environ)

# Service message
msg['SERVICE'] = '''
Service:  {0[NOTIFY_SERVICEDESC]}
State:    {0[NOTIFY_LASTSERVICESTATE]} -> {0[NOTIFY_SERVICESTATE]} ({0[NOTIFY_NOTIFICATIONTYPE]})
Command:  {0[NOTIFY_SERVICECHECKCOMMAND]}
Output:   {0[NOTIFY_SERVICEOUTPUT]}
Perfdata: {0[NOTIFY_SERVICEPERFDATA]}
{0[NOTIFY_LONGSERVICEOUTPUT]}'''.format(os.environ)

try:
    print "Send growl message:"
    what = os.environ['NOTIFY_WHAT']
    print msg[what]

    growl.notify(
        noteType = 'ALL',
        title = "NAGIOS MESSAGE",
        description = msg[what],
    #    icon = "http://example.com/icon.png",
        sticky = False,
        priority = 1,
    )
except Exception, e:
    print str(e)
    sys.exit(1)
