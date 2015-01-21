rpmforge_repo:
  file:
    - recurse
    - name: /etc/yum.repos.d
    - source: salt://repos/rpmforge/files
