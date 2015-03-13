#!/usr/bin/python
#coding:utf-8
import salt.client
import pprint

local = salt.client.LocalClient()
ret = local.cmd('os:XenServer', 'grains.item', expr_form='grain', args=['ipmi'])

for output in ret.items():
    minion_id = output[0]
    data = output[1]
    try:
        ipmi = data['ipmi']
    except:
        ipmi = None

    try:
        print minion_id, ipmi['IP Address']
    except:
        pass
