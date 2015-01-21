include:
  - cmk.agent

restart_cron:
  cron:
    - present
    - name: mk-job restart_salt-minion service salt-minion restart > /dev/null
    - user: root
    - daily: '*/60'
    - require:
      - pkg: check_mk-agent
