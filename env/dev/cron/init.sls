crond:
  service:
    - running
    - enable: True
  pkg:
    - name: time
    - installed
