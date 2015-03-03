pool:
  grains.present:
  {% if grains ['os'] == 'XenServer' %}
  {% set pool = salt['cmd.run']('xe pool-list --minimal params=name-label')%}
  - value: {{ pool }}
  {% endif %}
