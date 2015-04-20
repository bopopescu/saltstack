{% set proxy = {
  'http': 'http://squid:3142',
  'yum': 'http://squid:3142',
  'apt': 'http://squid:3142',
  'ftp': 'http://squid:3128',
  'perl': 'http://squid:3128',
  'wget': 'http://squid:3128',
  'curl': 'http://squid:3128',
  'cpan': 'http://squid:3128',
  'pip': 'http://squid:3128',
  'default': 'http://squid:3128',
  }
%}


{% if grains['os'] == 'XenServer' %}
yum:
  proxy: {{ proxy['yum'] }}
{% endif %}
