base:
  '*':
    - system.{{ grains['domain'] }}
    - device.server
  'xstest2':
    - project.cloudstack.host.{{ grains['host'] }}
