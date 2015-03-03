#include_tpl:
#  cmd.run:
#    - name: echo "$IncludeConfig /etc/rsyslog.d/*.conf" >> /etc/rsyslog.conf
#    - unless: grep -q rsyslog.d /etc/rsyslog.conf
#    - stateful: True

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

{% if grains['os'] in ('RedHat', 'CentOS') and salt['grains.get']('osmajorrelease', 'unknown') == '5' %}
SEC:
  file:
    - name: /tmp/sec-2.7.7-0.el5.noarch.rpm
    - source: salt://syslog/files/sec-2.7.7-0.el5.noarch.rpm
  cmd:
    - run
    - name: rpm -ivh /tmp/sec-2.7.7-0.el5.noarch.rpm > /dev/null
    - stateful: True
    - unless: test -d /etc/sec
{% endif %}
