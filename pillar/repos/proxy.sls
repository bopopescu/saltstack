{% if grains['os'] == 'XenServer' %}
proxy: http://squid:3142
{% endif %}
