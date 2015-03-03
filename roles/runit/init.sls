pkg_runit:
  file:
    - managed
    - name: /tmp/runit.rpm
    - source: salt://runit/files/runit-2.1.2-1.el6.{{ grains['osarch'] }}.rpm
  cmd:
    - run
    - name: rpm -ivh /tmp/runit.rpm > /dev/null
    - unless: rpm -qa | grep -q runit
    - stateful: True
