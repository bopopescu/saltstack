{% if grains['os'] in ['RedHat', 'CentOS'] %}
ntp_server:
  pkg:
    - installed
    - name: ntp
{% endif %}

{% if grains['os_family'] =='Debian' %}
ntp_server:
  pkg:
    - installed
    - name: ntpd
{% endif %}

ntpd_conf:
  file:
    - managed
    - name: /etc/ntp.conf
    - source: salt://ntp/client/ntp.conf.jinja
    - template: jinja
  service:
    - running
    - enable: True
  cmd:
    - run
    - name: service ntpd reload > /dev/null
    - require:
      - file: /etc/ntp.conf

Asia/Shanghai:
  timezone:
    - system
    - utc: false

sysconfig_clock:
  file:
    - managed
    - name: /etc/sysconfig/clock
    - source: salt://ntp/client/files/sysconfig

hwclock -w:
  cmd:
    - run
    - onlyif: test -f /dev/rtc
    - stateful: True
