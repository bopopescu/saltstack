#!/usr/bin/python
# -*- coding:utf-8 -*-
import sys
import re
import pprint

try:
    import salt.client
    local = salt.client.LocalClient()
except:
    sys.exit()

ret = local.cmd('*', 'grains.item', ['hwaddr_interfaces'])
for minion_id in ret.keys():
    hwaddr_interfaces = ret[minion_id]['hwaddr_interfaces']
    for interface in hwaddr_interfaces.keys():
        if interface.startswith('vif'):
            del hwaddr_interfaces[interface]
        elif interface.startswith('xapi'):
            del hwaddr_interfaces[interface]
        elif interface.startswith('lo'):
            del hwaddr_interfaces[interface]
        elif interface.startswith('tap'):
            del hwaddr_interfaces[interface]
    for intf in hwaddr_interfaces.keys():
        print "{0}_{1}: {2}".format(minion_id, intf, hwaddr_interfaces[intf])
       
