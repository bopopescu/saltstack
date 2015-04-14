#!/bin/bash
test -f /etc/xensource-inventory || exit 0
. /etc/xensource-inventory

#log_server='nagios01.hdtr.com,syslog.hdtr.com'
log_server=192.168.11.9

xe host-param-get param-name=logging param-key=syslog_destination uuid=$INSTALLATION_UUID > /dev/null 2>&1

if [ $? -eq 1 ];then
    xe host-param-set logging:syslog_destination=$log_server uuid=$INSTALLATION_UUID
    echo "set syslog destination to $log_server"
else
    output=$(xe host-param-get param-name=logging param-key=syslog_destination uuid=$INSTALLATION_UUID)
    if [ $output != $log_server ];then
        echo "modify syslog destination to $log_server"
    else
        echo "nothing changed, syslog destination is $log_server"
    fi
fi
