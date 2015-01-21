agent_local:
  file:
    - recurse
    - name: /usr/lib/check_mk_agent/local
    - source: salt://cmk/agent/files/local
    - file_mode: 755
    - clean: True
