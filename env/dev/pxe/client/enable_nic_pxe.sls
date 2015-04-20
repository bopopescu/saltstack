enable_pxe:
  file:
    - managed
    - name: /usr/sbin/bootutil32
    - source: salt://pxe/files/bootutil32
    - mode: 0755
  cmd:
    - run:
    - name: bootutil32 -STE -ALL > /dev/null
    - stateful: True
