base:
  '*':
    - system
    - device.server
  'os:XenServer':
    - match: grain
    - project.cloudstack.host.{{ grains['host'] }}
    - system.software.cmk.agent
  'salt':
    - system.software.cmk.agent.salt
