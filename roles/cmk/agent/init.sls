include:
{% if grains['os_family'] == 'RedHat' %}
  - cmk.agent.RedHat
{% elif grains['os_family'] == 'Debian' %}
  - cmk.agent.Debian
{% endif %}
  - cmk.agent.plugins
  - cmk.agent.local
  - cmk.agent.mrpe
  - cmk.agent.logwatch
