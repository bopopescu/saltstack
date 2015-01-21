agent_mrpe:
  file:
    - managed
    - name: /etc/check_mk/mrpe.cfg
    - source: salt://cmk/agent/mrpe.cfg.jinja
    - template: jinja
    - mode: 644
