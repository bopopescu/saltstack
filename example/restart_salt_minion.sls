update_salt_minion:
  pkg:
    - latest
    - name: salt-minion
    - order: last
  cmd:
    - wait
    - name: echo service salt-minion restart | at now + 1 minute
    - watch:
      - pkg: update_salt
