include:
  - project.cloudstack.z2

pod:
  name: z2p201
  clusters:
    - z2p201c1
  vlans:
    - 201
  networks:
    - '10.24.64.64/24'
