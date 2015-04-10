copy_file:
  file:
    - managed
    - name: /root/set_mgmt_pif_domain.sh
    - source: salt://XenServer/files/set_mgmt_pif_domain.sh
    - mode: 0755
  cmd:
    - run
    - name: /root/set_mgmt_pif_domain.sh > /dev/null
    - stateful: True
