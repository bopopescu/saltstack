#!/bin/bash
test -f /etc/xensource-inventory || exit 0
. /etc/xensource-inventory

mgmt_pif_uuid=$(xe pif-list management=true host-uuid=$INSTALLATION_UUID --minimal)
cur_mode=$(xe pif-param-get param-name=IP-configuration-mode uuid=$mgmt_pif_uuid) 
cur_ip=$(xe pif-param-get param-name=IP uuid=$mgmt_pif_uuid) 
cur_netmask=$(xe pif-param-get param-name=netmask uuid=$mgmt_pif_uuid) 
cur_gateway=$(xe pif-param-get param-name=gateway uuid=$mgmt_pif_uuid) 
cur_dns=$(xe pif-param-get param-name=DNS uuid=$mgmt_pif_uuid) 
cur_domain=$(xe pif-param-get param-name=other-config param-key=domain uuid=$mgmt_pif_uuid) 

new_mode='static'
new_domain='hdtr.com'
new_dns='192.168.12.30,192.168.12.31'

##### DEBUG ########
#echo "xe pif-reconfigure-ip uuid=$mgmt_pif_uuid mode=$new_mode IP=$cur_ip netmask=$cur_netmask gateway=$cur_gateway DNS=$new_dns"
#echo "xe pif-param-set uuid=$mgmt_pif_uuid other-config:domain=$new_domain"
#exit
####################

if [ "$cur_dns" == "$new_dns" ];then
    echo "current DNS settings is right, exit"    
else
    xe pif-reconfigure-ip uuid=$mgmt_pif_uuid mode=$new_mode IP=$cur_ip netmask=$cur_netmask gateway=$cur_gateway DNS=$new_dns
    cur_dns=$(xe pif-param-get param-name=DNS uuid=$mgmt_pif_uuid) 

    if [ "$cur_dns" == "$new_dns" ];then
        echo "set DNS successfully"
    else
        echo "set DNS failed"
    fi
fi

if [ "$cur_domain" == "$new_domain" ];then
    echo "current domain settings is right, exit"    
else
    xe pif-param-set uuid=$mgmt_pif_uuid other-config:domain=$new_domain
    cur_domain=$(xe pif-param-get param-name=other-config param-key=domain uuid=$mgmt_pif_uuid) 

    if [ "$cur_domain" == "$new_domain" ];then
        echo "set domain successfully"
    else
        echo "set domain failed"
    fi
fi
