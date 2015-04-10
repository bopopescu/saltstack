agent_logwatch:
  file:
    - managed
    - name: /root/check_mk-agent-logwatch-1.2.4p5-1.noarch.rpm
    - source: salt://cmk/agent/files/check_mk-agent-logwatch-1.2.4p5-1.noarch.rpm
  cmd:
    - run
    - name: rpm -ivh /root/check_mk-agent-logwatch-1.2.4p5-1.noarch.rpm > /dev/null
    - stateful: True
  file:
    - managed
    - name: /etc/check_mk/logwatch.cfg
    - source: salt://cmk/agent/logwatch.cfg.jinja
    - template: jinja
    - mode: 644
    - require:
      - pkg: check-mk-agent-logwatch
