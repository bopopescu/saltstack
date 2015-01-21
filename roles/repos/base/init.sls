base_repo:
  file:
    - recurse
    - name: /etc/yum.repos.d/
    - source: salt://repos/base/files/

{% if grains['os'] == 'RedHat' %}
sed -i '/releasever/s/\$releasever/6/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: /etc/yum.repos.d/
{% elif grains['os'] == 'XenServer' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
    - require:
      - file: /etc/yum.repos.d/
{% elif grains['osrelease'][0] == '5' %}
sed -i '/releasever/s/\$releasever/5/' /etc/yum.repos.d/*:
  cmd.run:
    - stateful: True
{% endif %}

refresh_db:
  cmd.run:
    - name:  yum clean all > /dev/null && yum makecache > /dev/null
    - stateful: True
    - watch:
      - file: /etc/yum.repos.d/
