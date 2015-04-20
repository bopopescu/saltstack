#include_tpl:
#  cmd.run:
#    - name: echo "$IncludeConfig /etc/rsyslog.d/*.conf" >> /etc/rsyslog.conf
#    - unless: grep -q rsyslog.d /etc/rsyslog.conf
#    - stateful: True
sec:
  pkg:
    - installed

{% if grains['os'] in ('RedHat', 'CentOS') and salt['grains.get']('osmajorrelease', 'unknown') == '6' %}
/etc/rsyslog.d:
  file:
    - recurse
    - source: salt://syslog/files/rsyslog.d
    - clean: True
    - mkdirs: True

/etc/rsyslog.conf
  file:
    - managed
    - source: salt://syslog/files/rsyslog.conf
    - require:
      - file: /etc/rsyslog.d
  service:
    - name: rsyslog
    - running
    - enable: True
    - watch:
      - file: /etc/rsyslog.conf
{% endif %}
