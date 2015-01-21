disabl_citrix_repo:
  cmd.run:
    - name: sed -i '/enabled=1/s/1/0/' /etc/yum.repos.d/Citrix.repo
    - onlyif: test -f /etc/yum.repos.d/Citrix.repo
    - stateful: True
