mirrorslist_remi:
  file:
    - managed
    - name: /etc/yum.repos.d/mirrors-remi-{{ grains['osmajorrelease'][0] }}
    - source: salt://repos/files/mirrors-remi-{{ grains['osmajorrelease'][0] }}

repo_remi:
  file:
    - managed
    - name: /etc/yum.repos.d/remi-release.repo
    - source: salt://repos/files/remi-release-{{ grains['osmajorrelease'][0] }}.repo
