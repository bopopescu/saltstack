{% set
  pools = {
    'z2p1c1': ['xs02', 'xs03', 'xs04', 'xs05', 'xs06', 'xs07', 'xs08'],
    'z2p2c1': ['xs51', 'xs52', 'xs53', 'xs54', 'xs226'],
    'z2p201c1': ['xstest1', 'xstest2'],
    'z4p1c1': ['z4p1c1h1', 'z4p1c1h1'],
    'xsm': ['xsm01', 'xsm02'],
  }
%}

{% for poolname, hosts in pools.items() %}
  {% if grains['id'] in hosts %}
    pool: {{ poolname }}
  {% endif %}
{% endfor %}
