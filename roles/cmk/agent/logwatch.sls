agent_logwatch:
  pkg:
    - installed
    - name: check_mk-agent-logwatch
  file:
    - managed
    - name: /etc/check_mk/logwatch.cfg
    - source: salt://cmk/agent/logwatch.cfg.jinja
    - template: jinja
    - mode: 644
    - require:
      - pkg: check_mk-agent-logwatch
