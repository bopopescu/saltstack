disable_selinux:
  cmd.run:
    - name: senenforce 0 ;sed -i '/^SELINUX/s/enforcing/disabled/' /etc/selinux/config
    - onlyif: test -f /etc/selinux/config
    - stateful: True
