#!/bin/bash
test -f /etc/xensource-inventory || exit 0
. /etc/xensource-inventory
xe host-param-get param-name=logging param-key=syslog_destination uuid=$INSTALLATION_UUID
