# Written by WATO
# encoding: utf-8

all_hosts += [
  "s-2146-VM|lan|obj_server|cmk-agent|tcp|os_other|state_up|prod|wato|/" + FOLDER_PATH + "/",
]


# Host attributes (needed for WATO)
host_attributes.update(
{'s-2146-VM': {'tag_agent': 'cmk-agent',
               'tag_criticality': 'prod',
               'tag_networking': 'lan',
               'tag_os': 'os_other',
               'tag_rack_obj': 'obj_server',
               'tag_state': 'state_up'}})
