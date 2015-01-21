plugins_deps:
  pkg.latest:
    - names:
      - mtr
      - dmidecode
      - freeipmi
      - bind-utils
      - pynag
      - nagios-plugins-ping
      - nagios-plugins-dns
      - nagios-plugins-setuid

agent_plugins:
  file:
    - recurse
    - name: /usr/lib/check_mk_agent/plugins
    - source: salt://cmk/agent/files/plugins
    - file_mode: 755
    - clean: True
