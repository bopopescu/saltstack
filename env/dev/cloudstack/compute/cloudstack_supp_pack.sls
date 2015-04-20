cloud-supp:
  file:
    - managed
    - name: /tmp/xenserver-cloud-supp.iso
    - source: salt://XenServer/files/xenserver-cloud-supp.iso
  cmd:
    - run
    - name: echo Y | xe-install-supplemental-pack /tmp/xenserver-cloud-supp.iso > /dev/null
    - stateful: True
    - require:
      - file: /tmp/xenserver-cloud-supp.iso
