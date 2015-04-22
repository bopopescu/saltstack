# Written by WATO
# encoding: utf-8


host_contactgroups = [
  ( 'all', ['/' + FOLDER_PATH + '/+'], ALL_HOSTS, {'comment': u'Put all hosts into the contact group "all"'} ),
] + host_contactgroups

extra_host_conf['_LOCATION'] = [
  ("uri://loc/B2-F0X-DXX", ALL_HOSTS),
]

extra_host_conf['_MINION_ID'] = [
  ("uri://sls/$HOSTNAME$", ALL_HOSTS),
]

extra_host_conf['_UUID'] = [
  ("uri://uuid/$HOSTNAME$", ALL_HOSTS),
]

extra_host_conf['_RACKTABLES'] = [
  ("uri://rack/$HOSTNAME$", ALL_HOSTS),
]

extra_host_conf['_WIKI'] = [
  ("uri://wiki/$HOSTNAME$", ALL_HOSTS),
]

extra_host_conf['_ITOP'] = [
  ("uri://itop/$HOSTNAME$", ALL_HOSTS),
]
