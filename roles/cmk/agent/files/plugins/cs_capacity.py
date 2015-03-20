#!/usr/bin/python
#coding:utf-8
# check_mk agent plugin for cloudstack capacity
# require: pip install cmonkey
import commands
import json

type = {
    '0': 'CAPACITY_TYPE_MEMORY',
    '1': 'CAPACITY_TYPE_CPU',
    '2': 'CAPACITY_TYPE_STORAGE',
    '3': 'CAPACITY_TYPE_STORAGE_ALLOCATED',
    '4': 'CAPACITY_TYPE_VIRTUAL_NETWORK_PUBLIC_IP',
    '5': 'CAPACITY_TYPE_PRIVATE_IP',
    '6': 'CAPACITY_TYPE_SECONDARY_STORAGE',
    '7': 'CAPACITY_TYPE_VLAN',
    '8': 'CAPACITY_TYPE_DIRECT_ATTACHED_PUBLIC_IP',
    '9': 'CAPACITY_TYPE_LOCAL_STORAGE',
}

endpoint="http://csm01:8080/client/api"
apikey="f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q"
secretkey="8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g"
apicmd="listCapacity"
#args="type=2"
args = ""
cmd = "cmonkey -e %s -a %s -s %s %s %s" % (endpoint, apikey, secretkey, apicmd, args)

response = commands.getoutput(cmd)
output =json.loads(response)
status = output['status-code']
records = output['content-body']['listcapacityresponse']['capacity']
#print records
#print pprint.pformat(output)
capacity = {}
zonename = None

if status == 200:
    print "<<<cs_capacity>>>"

    for cap_id in range(0, 10):
        print "[%s]" % type[str(cap_id)]
        print "#zonename capacitytotal(KB) capacityused(KB) percentused(%)"
        for record in records:
            if record['type'] == cap_id:
                print "{0[zonename]} {0[capacitytotal]} {0[capacityused]} {0[percentused]}".format(record)
