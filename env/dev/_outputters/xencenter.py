#!/usr/bin/python
#coding:utf-8
'''
<?xml version="1.0" encoding="utf-16"?>
<XenConnections>
  <XenConnection>
    <Hostname>192.168.11.13</Hostname>
    <Port>443</Port>
    <FriendlyName>xsm02</FriendlyName>
  </XenConnection>
</XenConnections>
'''
import salt.client

local = salt.client.LocalClient()
ret = local.cmd('os:XenServer', 'grains.item', expr_form='grain', arg=['fqdn_ip4', 'host'])
for id, output in ret.items():
  print id
  print 'hostname: {0.fqdn_ip4[0]}'.format(output)
