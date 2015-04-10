#!/bin/bash
test -f /etc/xensource-inventory || exit 0
. /etc/xensource-inventory

pif_mgmt_uuid=$(xe pif-list host-uuid=$INSTALLATION_UUID management=true --minimal)

if xe pif-param-get param-name=other-config param-key=domain uuid=$pif_mgmt_uuid > /dev/null 2>&1;then
    domain=$(xe pif-param-get param-name=other-config param-key=domain uuid=$pif_mgmt_uuid)
    if [ ! "$domain" == "hdtr.com" ];then
        xe pif-param-set uuid=$pif_mgmt_uuid other-config:domain=hdtr.com
    fi
else
    xe pif-param-set uuid=$pif_mgmt_uuid other-config:domain=hdtr.com
fi
