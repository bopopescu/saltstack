squid:
  server:
    squid.hdtr.com:
      port: 3128
    '192.168.31.246':
      port: 3128

racktables:
  server:
    - rack.hdtr.com
    - 192.168.11.7

domain:
  search: hdtr.com
  nameserver:
    - 192.168.12.30
    - 192.168.12.31
ntp:
  server:
    - ntp.hdtr.com
    - 192.168.11.10

syslog:
  server:
    - syslog.hdtr.com
    - 192.168.11.9
    - 192.168.12.9

mail:
  smtp:
    - mail01.hdtr.com
    - 192.168.31.241

salt:
  master:
    - salt.hdtr.com
    - 192.168.12.7

pxe:
  server:
    - pxe.hdtr.com
    - 192.168.11.8

nagios:
  server:
    - nagios01.hdtr.com
