import sys, os
import urllib
import re, pprint
import json

def get_object_allocation(object_id):

  _request_uri = 'http://admin:gdcloud.com@racktables/racktables/api.php?method=get_object_allocation&object_id=%s' % object_id
  http_body = urllib.urlopen(_request_uri).read()
  output = json.loads(http_body)
  objects =  output['response']
  return objects

def pprinter(data):
    pp = pprint.PrettyPrinter()
    pp.pprint(data)

_racks = get_object_allocation(7)
for _k, _v in _racks.items():
    print _k, _v
