#!/usr/bin/python
#coding:utf-8
import salt.client
import pprint
import sys, os

local = salt.client.LocalClient()
ret = local.cmd('os:XenServer', 'grains.item', ['ipmi'], expr_form='grain')

for output in ret.items():
    minion_id = output[0]
    try:
        ipmi = output[1]['ipmi']
        print minion_id, ipmi['ip']
    except:
        pass
