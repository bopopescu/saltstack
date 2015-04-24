check_mk-agent-deps:
  pkg:
    - installed
    - names:
      - xinetd
      - smartmontools
  service:
    - running
    - name: xinetd

check_mk-agent:
  pkg:
    - installed
    - skip_verify: True
    - sources:
      - check_mk-agent: salt://cmk/agent/files/check_mk-agent-1.2.4p5-1.noarch.rpm
    - require:
      - pkg: xinetd
      - service: xinetd
  iptables:
    - insert
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 6556
    - proto: tcp
    - save: True

include:
  - .plugins
  - .local
  - .spool
  - .mrpe
  - .logwatch
