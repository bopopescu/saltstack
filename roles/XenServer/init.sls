include:
  - XenServer.add_license
  - XenServer.repo

python-hashlib:
    pkg.installed

xenserver-cloud-supp.iso:
  file:
    - managed
    - name: /root/xenserver-cloud-supp.iso
    - source: salt://XenServer/files/xenserver-cloud-supp.iso
  cmd:
    - run
    - name: xe-install-supplemental-pack /root/xenserver-cloud-supp.iso > /dev/null
    - stateful: True
