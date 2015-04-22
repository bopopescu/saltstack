add_license:
  file:
    - managed
    - name: /root/xs602.xslic
    - source: salt://XenServer/files/xs602.xslic
  cmd:
    - run
    - name: xe host-license-add license-file=/root/xs602.xslic
    - creates: /tmp/xslic-xs602
