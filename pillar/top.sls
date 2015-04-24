base:
  '*':
    - system.{{ grains['kernel'] }}
    - device.server
  'xstest2':
    - project.cloudstack.host.{{ grains['host'] }}
