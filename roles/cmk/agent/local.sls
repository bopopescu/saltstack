{% for local in pillar['cmk']['local'] %}
cmk/agent/local/{{ local }}:
  file:
    - managed
    - name: /usr/lib/check_mk_agent/local/{{ local }}
    - source: salt://cmk/agent/files/local/{{ local }}
    - makedirs: True
    - mode: 755
    - clean: True
{% endfor %}
