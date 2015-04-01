#!/bin/bas
uuids=$(xe host-list --minimal | tr ',' '\n')
for uuid in $uuids
do
    output=$(xe host-param-get param-name=logging param-key=syslog_destination uuid=$uuid)
    if [ $output != '192.168.11.9' ];then
       echo "set syslog destination for $uuid"
       xe host-param-set logging:syslog_destination=192.168.11.9 uuid=$uuid
    fi
done
