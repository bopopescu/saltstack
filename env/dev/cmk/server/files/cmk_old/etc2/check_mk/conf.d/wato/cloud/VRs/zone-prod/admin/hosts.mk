# Written by WATO
# encoding: utf-8

all_hosts += [
  "r-1517-VM|state_stopped|wato|/" + FOLDER_PATH + "/",
]


# Host attributes (needed for WATO)
host_attributes.update(
{'r-1517-VM': {'alias': None,
               'ipaddress': None,
               'snmp_community': None,
               'tag_agent': None,
               'tag_criticality': None,
               'tag_networking': None,
               'tag_os': None,
               'tag_rack_obj': None,
               'tag_state': 'state_stopped'}})
