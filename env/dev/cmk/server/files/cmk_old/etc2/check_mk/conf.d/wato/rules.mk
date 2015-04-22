# Written by WATO
# encoding: utf-8


if only_hosts == None:
    only_hosts = []

only_hosts = [
  ( ['!offline', ], ALL_HOSTS, {'comment': u'Do not monitor hosts with the tag "offline"'} ),
  ( ['state_up', ], ALL_HOSTS ),
  ( ['state_running', ], ALL_HOSTS ),
] + only_hosts


extra_host_conf.setdefault('notes_url', [])

extra_host_conf['notes_url'] = [
  ( 'http://10.24.4.84/dev/wiki/hosts/$HOSTNAME$', [], ALL_HOSTS ),
] + extra_host_conf['notes_url']


bulkwalk_hosts = [
  ( ['!snmp-v1', ], ALL_HOSTS, {'comment': u'Hosts with the tag "snmp-v1" must not use bulkwalk'} ),
] + bulkwalk_hosts


extra_service_conf.setdefault('icon_image', [])

extra_service_conf['icon_image'] = [
  ( None, [], ['xs201'], ['Check_MK inventory'] ),
] + extra_service_conf['icon_image']


extra_service_conf.setdefault('notes_url', [])

extra_service_conf['notes_url'] = [
  ( 'http://10.24.4.84/dev/wiki/hosts/$HOSTNAME$/$SERVICEDESC$', [], ALL_HOSTS, ALL_SERVICES ),
] + extra_service_conf['notes_url']


ping_levels = [
  ( {'loss': (80.0, 100.0), 'packets': 6, 'timeout': 20, 'rta': (1500.0, 3000.0)}, ['wan', ], ALL_HOSTS, {'comment': u'Allow longer round trip times when pinging WAN hosts'} ),
] + ping_levels

