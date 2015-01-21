{% if grains['os_family'] =='RedHat' %}
{% set ntp = 'ntp' %}
{% endif %}

{% if grains['os_family'] =='Debian' %}
{% set ntp = ntpd %}
{% endif %}

ntpd:
  pkg:
    - installed
    - name: {{ ntp }}
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ntp.conf
    - require:
      - pkg: ntp
  file:
    - managed
    - name: /etc/ntp.conf
    - source: salt://ntp/client/ntp.conf.jinja
    - template: jinja

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
  cmd.run:
    - onlyif: test -f /dev/rtc
    - stateful: True
