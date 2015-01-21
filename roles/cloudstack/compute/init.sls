include:
{% if grains['os'] == 'XenServer' %}
  - yum.proxy
  - yum.utils
  - repos.base
  - repos.epel
  - repos.rpmforge
  - ipatbles
  - ipmi
  - cmk.agent
  - ntp.client
  - XenServer.add_license
{% endif %}
