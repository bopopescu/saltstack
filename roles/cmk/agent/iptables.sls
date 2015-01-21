agent_iptables:
  cmd.run:
    - name: iptables -I INPUT 1 -m tcp -p tcp --dport 6556 -j ACCEPT
    - unless: iptables -L | grep -q 6556
    - stateful: True
    - require:
      - pkg: check_mk-agent

agent_iptables_save:
  cmd.wait:
    - name: iptables-save > /etc/sysconfig/iptables
    - stateful: True
    - unless: grep 6556 -q /etc/sysconfig/iptables
    - watch:
      - cmd: mk_agent-iptables
