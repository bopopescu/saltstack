{% set
  roles = {
    'dns_server': ['dns01', 'dns02'],
    'ntp_server': ['ntp', 'ntp01'],
    'mail_server': ['mail', 'mail01'],
    'nagios_server': ['nagios01', 'nagios02'],
    'backup_server': ['backup01'],
    'ldap_server': ['ldap', 'ad'],
    'squid_server': ['squid'],
    'mysql_server': ['csdb-master', 'csdb-slave'],
    'web_server': ['csm01', 'csm02'],
    'ftp_server': ['ftp01'],
    'salt-master': ['salt'],
  }
%}

roles:
{% for name, members in roles.items() %}
  {% if grains['id'] in members %}
    - {{ name }}
  {% endif %}
{% endfor %}

{% if grains['os'] == 'XenServer' %}
{% set pool = salt['cmd.run']('uname -a') %}
pool: {{ pool }}
{% endif %}
