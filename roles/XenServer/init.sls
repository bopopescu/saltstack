include:
  - ipmi

add_license:
  file:
    - managed
    - name: /root/xs602.xslic
    - source: {{ pillar['license_file'] }}
  cmd:
    - run
    - name: xe host-license-add license-file=/root/xs602.xslic
    - creates: /tmp/xslic-xs602

citrix_repo:
  pkgrepo.mangaged:
    - disabled: True

python-pkgs:
  pkg:
    - installed
    - names:
      - python-hashlib
      - python26-distribute
  cmd:
    - run
    - name: easy_install-2.6 pip
    - creates: /tmp/easy_install-2.6-pip

dbtool:
  file.managed:
    - name: /usr/local/bin/dbtool
    - source: salt://XenServer/files/dbtool
    - mode: 0755
