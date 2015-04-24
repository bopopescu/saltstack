plugins_deps:
  pkg.latest:
    - names:
      - mtr
      - dmidecode
      - freeipmi
      - bind-utils
      - pynag
      - lm_sensors
      - nagios-plugins-ping
      - nagios-plugins-dns

{% for plugin in pillar['cmk']['plugins'] %}
cmk_agent_plugin_{{ plugin }}:
  file:
    - managed
    - name: /usr/lib/check_mk_agent/plugins/{{ plugin }}
    - source: salt://cmk/agent/files/plugins/{{ plugin }}
    - mode: 755
    - makedirs: True
    - clean: True
{% endfor %}
