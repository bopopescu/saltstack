#!/usr/bin/python
import requests
import os, sys
import pprint

url = 'http://10.24.4.48/racktables/index.php?module=redirect&page=depot&tab=addmore&op=addObjects'
payload = {}
payload['0_object_type_id'] = '1504'
payload['0_object_name'] = 'vm_1504'
payload['0_object_label'] = 'vm_1504'
payload['0_object_asset_no'] = 'vm_1504'

rt_user = 'zhanghu'
rt_pass = 'zhanghu'
rt_headers = {'Content-Type': 'application/x-www-form-urlencoded'}
rt_auth = requests.auth.HTTPBasicAuth(rt_user, rt_pass)

response = requests.post(url, data=payload, headers=rt_headers, auth=rt_auth)

if response.status_code == requests.codes.ok:
    print "create object success !"
else:
    print "create object failed !"
