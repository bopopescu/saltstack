sshd_config:
  cmd.run:
    - name: sed -r -i '/UseDNS|GSSAPIAuthentication/s/yes/no/' /etc/ssh/sshd_config
    - stateful: True

permit_root_login:
  file:
    - replace
    - pattern: without-password
    - repl: yes
