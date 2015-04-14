include:
  - XenServer.add_license
  - XenServer.install_supp_pack

citrix_repo:
  pkgrepo.mangaged:
    - disabled: True

python-hashlib:
    pkg.installed

dbtool:
  file.managed:
    - name: /usr/local/bin/dbtool
    - source: salt://XenServer/files/dbtool
    - mode: 0755
