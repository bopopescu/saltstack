include:
  - project.cloudstack.z2.p2.c1

name-label: {{ grains['id'] }}
host_label: {{ grains['id'] }}
iscsi_iqn: 'iqn.2013-05.com.gdcloud:{{ grains['host'] }}'
