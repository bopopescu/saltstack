import_key:
  file:
    - managed
    - name: /tmp/icinga.key
    - source: salt://nagios/icinga/files/icinga.key
  cmd:
    - name: rpm --import /tmp/icinga.key > /dev/null
    - stateful: True
    - require:
      - file: /tmp/icinga.key

add_repo:
  file:
    - managed
    - name: /etc/yum.repos.d/ICINGA-release.repo
    - source: salt://nagios/icinga/ICINGA-release.repo
    - require:
      - cmd: rpm --import /tmp/icinga.key > /dev/null
  pkgrepo:
    - refresh
  pkg:
    - installed
    - names:
      - icinga2
