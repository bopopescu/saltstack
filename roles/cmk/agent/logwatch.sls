cmk_logwatch:
  file:
    - managed
    - name: /etc/check_mk/logwatch.cfg
    - source: salt://cmk/agent/logwatch.cfg.jinja
    - template: jinja
    - mode: 644
