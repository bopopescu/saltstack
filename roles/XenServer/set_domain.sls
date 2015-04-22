set_mgmt_pif_resolv:
  file:
    - managed
    - name: /root/set_mgmt_pif_resolv.sh
    - source: salt://XenServer/files/set_mgmt_pif_resolv.sh
    - mode: 0755
  cmd:
    - run
    - name: /root/set_mgmt_pif_resolv.sh
