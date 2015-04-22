set_syslog:
  file:
    - managed
    - name: /root/set_syslog_destination.sh
    - source: salt://XenServer/files/set_syslog_destination.sh
    - mode: 0755
  cmd:
    - run
    - name: /root/set_syslog_destination.sh
    - creates: /tmp/set_syslog_destination
