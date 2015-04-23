{% if grains['os_family'] == 'RedHat' %}
xs-tools:
  files:
    - xe-guest-utilities-6.0.2-766.{{ grains['osarch'] }}.rpm
    - xe-guest-utilities-xenstore-6.0.2-766.{{ grains['osarch'] }}.rpm
{% endif %}

{% if grains['os_family'] == 'Debian' %}
xs-tools:
  files:
    - xe-guest-utilities_6.0.2-766_i386.deb
{% endif %}
