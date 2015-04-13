include:
  - cmk.agent.plugins
  - cmk.agent.local

xinetd:
  pkg:
    - installed
  service:
    - running

check_mk_agent:
  pkg:
    - installed
    - skip_verify: True
    - sources:
      - check_mk-agent: salt://cmk/agent/files/check_mk-agent-1.2.4p5-1.noarch.rpm
    - require:
      - pkg: xinetd
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
  file:
    - managed
    - name: /etc/check_mk/mrpe.cfg
    - source: salt://cmk/agent/mrpe.cfg.jinja
    - template: jinja
    - mode: 644

cfg_logwatch:
  file:
    - managed
    - name: /etc/check_mk/logwatch.cfg
    - source: salt://cmk/agent/logwatch.cfg.jinja
    - template: jinja
    - mode: 644

smartmontools:
  pkg.installed
