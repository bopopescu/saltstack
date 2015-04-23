base:
  '*':
    - system
    - device.server
  'xstest2':
    - project.cloudstack.host.{{ grains['host'] }}
