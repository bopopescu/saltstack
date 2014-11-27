# Written by WATO
# encoding: utf-8

all_hosts += [
  "i-6-128-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-6-129-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-6-131-VM|Running|wato|/" + FOLDER_PATH + "/",
  "i-6-133-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-6-134-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-6-135-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-6-136-VM|Stopped|wato|/" + FOLDER_PATH + "/",
  "i-6-137-VM|Running|wato|/" + FOLDER_PATH + "/",
]


host_contactgroups.append(
  ( ['weiwang'], [ '/' + FOLDER_PATH + '/' ], ALL_HOSTS ))

# Host attributes (needed for WATO)
host_attributes.update(
{'i-6-128-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Stopped'},
 'i-6-129-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Running'},
 'i-6-131-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Running'},
 'i-6-133-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Stopped'},
 'i-6-134-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Stopped'},
 'i-6-135-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Stopped'},
 'i-6-136-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Stopped'},
 'i-6-137-VM': {'alias': None,
                'ipaddress': None,
                'snmp_community': None,
                'tag_agent': None,
                'tag_criticality': None,
                'tag_networking': None,
                'tag_state': 'Running'}})