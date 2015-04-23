base:
  '*':
    - system.os.{{ grains['os'] }}.{{ grains['osrelease'] }}
  'xstest2':
    - device.server.cloudstack.host.{{ grains['host'] }}
