folder:
  server:
    - xsm01
    - xsm02
    - xs02
    - xs03
    - xs04
    - xs05
    - xs06
    - xs07
    - xs08
  vm:
    - nagios01
    - nagios02
    - squid
    - ntp01
    - ftp01
    - backup01
    - salt
    - pxe
    - dns01
    - dns02
    - mail01
  router:
    permission: None
    title: Router
    tag_agent: cmk-agent
    tag_criticality: prod
    tag_networking: lan
  network_security:
    firwall:
      - internet-fw01
      - internet-fw02
    vpn:
      - internet-vpn01
    security_gateway:
      - sg01
  network_switch:
    - internet-sw01
    - core-sw01
    - access-sw01
    - access-sw02
    - ipmi-sw01
    - ipmi-sw02
    - user-sw01
    - fc-sw01
    - fc-sw02
