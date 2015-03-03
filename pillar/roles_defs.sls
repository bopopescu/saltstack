{% set
  roles = {
    'dns': ['dns01', 'dns02'],
    'ntp': ['ntp', 'ntp01'],
    'mail': ['mail', 'mail01'],
    'nagios': ['nagios01', 'nagios02'],
    'backup': ['backup01'],
    'ldap': ['ldap', 'ad'],
    'compute': ['xstest1', 'xstest2'],
  }
%}

{% set
  cluster = {
    'z2p201c1': ['xstest1.gdcloud.com', 'xstest2'],
  }
%}

roles:
{% for name, members in roles.items() %}
  {% if grains['id'] in members %}
    - {{ name }}
  {% endif %}
{% endfor %}

cluster:
{% for name, members in cluster.items() %}
  {% if grains['id'] in members %}
    - {{ name }}
  {% endif %}
{% endfor %}
