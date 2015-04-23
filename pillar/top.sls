base:
  '*':
    - system
  'xstest2':
    - project.cloudstack.host.{{ grains['host'] }}
