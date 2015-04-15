#!/bin/bash
test -f /etc/xensource-inventory || exit 0
. /etc/xensource-inventory

#log_server='nagios01.hdtr.com,syslog.hdtr.com'
new_logserver="192.168.11.9"

cur_logserver=$(xe host-param-get param-name=logging param-key=syslog_destination uuid=$INSTALLATION_UUID)

if [ "$cur_logserver" == "$new_logserver" ];then
    echo "OK- Do nothing, current syslog destination is: $cur_logserver"
else
    xe host-param-set logging:syslog_destination=$new_logserver uuid=$INSTALLATION_UUID
    cur_logserver=$(xe host-param-get param-name=logging param-key=syslog_destination uuid=$INSTALLATION_UUID)
    if [ "$cur_logserver" == "$new_logserver" ];then
        echo "OK - syslog destination to $new_logserver successfully"
    else
        echo "WARN - set syslog destination to $new_logserver failed"
    fi
fi
