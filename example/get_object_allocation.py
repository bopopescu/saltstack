#!/usr/bin/python
import sys, os
import requests
import re, pprint
import json

def get_object_allocation(_object_id):

  _auth = ('zhanghu', 'zhanghu')
  _url = 'http://racktables/racktables/'
  _api_url = 'http://racktables/racktables/api.php'
  _params = {}
  _params['method'] = 'get_object_allocation'
  _params['object_id'] = _object_id
  _s = requests.Session()
  _login = _s.get(_api_url, auth=_auth, params=_params)
  _objects = _login.json()['response']
  return _objects

def pprinter(_data):
    _pp = pprint.PrettyPrinter()
    _pp.pprint(_data)

_allocs = get_object_allocation(7)
for _alloc in _allocs.items():
    pprinter(_alloc)
