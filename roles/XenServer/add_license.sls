{% if grains['osrelease'].startswith('6.0.2') %}
add_license:
  file:
    - managed
    - name: /tmp/xs602.xslic
    - source: salt://XenServer/files/xs602.xslic
  cmd:
    - run
    - name: xe host-license-add license-file=/tmp/xs602.xslic > /dev/null
    - stateful: True
{% endif %}
