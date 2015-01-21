/etc/apt/sources.list.d/check_mk.list:
  file:
    - managed
    - source: salt://cmk/agent/files/check_mk.list

check_mk-agent:
  pkg:
    - installed
    - name: nagios-plugins-basic
  cmd:
    - run
    - name: apt-get install check-mk-agent --force-yes -y > /dev/null
    - stateful: True
    - unless: dpkg -l | grep -q check-mk-agent 
    - require:
      - file: /etc/apt/sources.list.d/check_mk.list
