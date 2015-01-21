mk_agent:
  file:
    - managed
    - name: /etc/yum.repos.d/cmk.repo
    - source: salt://cmk/agent/files/cmk.repo
  pkg:
    - latest
    - names:
      - xinetd
      - check_mk-agent
