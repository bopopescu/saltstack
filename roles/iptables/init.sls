service iptables stop > /dev/null:
  cmd.run:
    - stateful: True

iptables:
  service:
    - dead
    - enable: False

ip6tables:
  service:
    - dead
    - enable: False
