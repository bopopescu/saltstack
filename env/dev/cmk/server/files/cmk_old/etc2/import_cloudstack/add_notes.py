#!/usr/bin/python
# coding: utf-8
import CloudStack, pprint, os

#parser = argparse.ArgumentParser()
#parser.add_argument("-d", type=str, choices=('/tmp', '/tmp/vm'), nargs=1, action='store', dest='dst_dir', help="default wato_vm root folder")
#args = parser.parse_args()
#print args.dst_dir

mhost = {
  'api': 'http://csm01:8080/client/api',
  'apikey': 'f0Q70X5oTpax-b7bvyzDQf2t_rKaK0rWkLXhejPRqI4i6IgiSq5rJ5_KXo7pCE9-HpYqAYllg_Td9675H3E31Q',
  'secret': '8VxNvOkcKn7ibGAQhmI2L8frA7LmdN-IIGXNgmKJ_UxzWTpc487cFLE-vq0yLrXS6-dzL7luNecUyH0elrOA9g',
}

cs = CloudStack.Client(mhost['api'], mhost['apikey'], mhost['secret'])

def get_vms():
  vms = []
  vms = cs.listVirtualMachines({'listall': 'True'})
  return vms

vms = get_vms()
for vm in vms:
  notes = ''
  try:
    notes = "zone: %s</br>host: %s</br>created: %s</br>cpunumber: %s</br>memory: %s</br>serviceoffering: %s" % (vm['zonename'], vm['hostname'], vm['created'], vm['cpunumber'], vm['memory'], vm['serviceofferingname'])
  except:
    notes = "zone: %s</br>created: %s</br>cpunumber: %s</br>memory: %s</br>serviceoffering: %s" % (vm['zonename'], vm['created'], vm['cpunumber'], vm['memory'], vm['serviceofferingname'])
  host_notes = '/tmp/notes/hosts/' + vm['instancename']
  f = open(host_notes,'w')
  f.write(notes) 
  f.close()
