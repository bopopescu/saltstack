include:
  - proxy

disable_plugin:
  cmd.run:
    - name: sed -i '/^plugin/s/1/0' /etc/yum.conf
    - stateful: True
