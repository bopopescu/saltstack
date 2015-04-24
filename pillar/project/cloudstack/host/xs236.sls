include:
  - project.cloudstack.z2.p1.c4

name-label: {{ grains['id'] }}
host_label: {{ grains['id'] }}
iscsi_iqn: 'iqn.2013-05.com.gdcloud:{{ grains['host'] }}'
