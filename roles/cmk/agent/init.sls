include:
  - cmk.agent.plugins
  - cmk.agent.local
  - cmk.agent.mrpe
  - cmk.agent.logwatch

xinetd:
  pgk:
    - installed
  service:
    - running

smartmontools:
  pkg.installed
