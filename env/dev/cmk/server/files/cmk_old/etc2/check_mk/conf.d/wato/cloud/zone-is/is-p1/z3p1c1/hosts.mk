# Written by WATO
# encoding: utf-8

all_hosts += [
  "xs201|state_up|wato|/" + FOLDER_PATH + "/",
  "xs202.gdcloud.com|lan|obj_server|cmk-agent|tcp|os_other|state_up|prod|wato|/" + FOLDER_PATH + "/",
  "xs203.gdcloud.com|state_up|wato|/" + FOLDER_PATH + "/",
  "xs204.gdcloud.com|state_up|wato|/" + FOLDER_PATH + "/",
  "xs205|state_up|wato|/" + FOLDER_PATH + "/",
]


# Host attributes (needed for WATO)
host_attributes.update(
{'xs201': {'alias': None,
           'ipaddress': None,
           'snmp_community': None,
           'tag_agent': None,
           'tag_criticality': None,
           'tag_networking': None,
           'tag_os': None,
           'tag_rack_obj': None,
           'tag_state': 'state_up'},
 'xs202.gdcloud.com': {'tag_os': 'os_other',
                       'tag_rack_obj': 'obj_server',
                       'tag_state': 'state_up'},
 'xs203.gdcloud.com': {'alias': None,
                       'ipaddress': None,
                       'snmp_community': None,
                       'tag_agent': None,
                       'tag_criticality': None,
                       'tag_networking': None,
                       'tag_os': None,
                       'tag_rack_obj': None,
                       'tag_state': 'state_up'},
 'xs204.gdcloud.com': {'alias': None,
                       'ipaddress': None,
                       'snmp_community': None,
                       'tag_agent': None,
                       'tag_criticality': None,
                       'tag_networking': None,
                       'tag_os': None,
                       'tag_rack_obj': None,
                       'tag_state': 'state_up'},
 'xs205': {'alias': None,
           'ipaddress': None,
           'snmp_community': None,
           'tag_agent': None,
           'tag_criticality': None,
           'tag_networking': None,
           'tag_os': None,
           'tag_rack_obj': None,
           'tag_state': 'state_up'}})
