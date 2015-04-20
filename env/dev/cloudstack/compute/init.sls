{% if grains['os'] == 'XenServer' %}
include:
  - yum.proxy
  - yum.utils
  - repos.base
  - repos.epel
  - repos.rpmforge
  - iptables
  - ipmi
  - cmk.agent
  - ntp.client
  - XenServer.add_license

/etc/resolv.conf:
  file:
    - managed
    - source: salt://cloudstack/compute/files/resolv.conf
{% endif %}
