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
    - source: salt://ntp/client/files/ntp.conf

restart_ntpd:
  service:
    - running
    - name: ntpd
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ntp.conf

step-tickers:
  file:
    - managed
    - name: /etc/ntp/step-tickers
    - source: salt://ntp/client/files/step-tickers

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
