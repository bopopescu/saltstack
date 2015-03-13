#!/usr/bin/python
#coding:utf-8
import salt.client
import pprint

local = salt.client.LocalClient()
ret = local.cmd('*', 'grains.item', ['ipmi'])
print pprint.pformat(ret)
