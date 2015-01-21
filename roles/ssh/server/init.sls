sshd_config:
  cmd.run:
    - name: sed -r -i '/UseDNS|GSSAPIAuthentication/s/yes/no/' /etc/ssh/sshd_config
    - stateful: True
