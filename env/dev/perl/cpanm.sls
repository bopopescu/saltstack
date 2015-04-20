cpanm:
  file.managed:
    - name: /usr/bin/cpanm
    - source: salt://perl/files/cpanm
    - mode: 0755
