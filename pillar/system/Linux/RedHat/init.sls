include:
  - .{{ grains['os'] }}

yum:
  proxy: 'http://squid:3142'
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
