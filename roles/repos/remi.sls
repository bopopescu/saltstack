repo_remi:
  file:
    - managed
    - name: /etc/yum.repos.d/remi-release.repo
    - source: salt://repos/files/remi-release-{{ grains['osmajorrelease'][0] }}.repo
