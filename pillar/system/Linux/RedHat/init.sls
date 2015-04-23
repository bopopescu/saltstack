include:
  - system.Linux.RedHat.{{ grains['os'] }}

selinux:
  enabled: False
  enforcing: disabled

iptables:
  enabled: False

hwclock:

kmod:
  loaded:
    - ipmi_si

yum:
  plugin:
    disabled:
      - fastestmirror
      - etckeeper

pkg:
  apache:
    name: httpd
  vim:
    name: vim-enhanced
  ntpd:
    name: ntp
