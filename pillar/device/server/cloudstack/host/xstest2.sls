include:
  - device.server.cloudstack.cluster.z2p201c1

name-label: {{ grains['id'] }}
host_label: {{ grains['id'] }}
iscsi_iqn: 'iqn.2013-05.com.gdcloud:{{ grains['host'] }}'
