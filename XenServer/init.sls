disabl_citrix_repo:
  cmd.run:
    - name: sed -i '/enabled=1/s/1/0/' /etc/yum.repos.d/Citrix.repo
    - onlyif: test -f /etc/yum.repos.d/Citrix.repo
    - stateful: True

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
