include:
  - project.cloudstack.z2.p2

cluster:
  name: z2p2c1
  hosts:
    - xs51
    - xs52
    - xs53
    - xs54
    - xs226
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/cloud/z2p2c1
    label: nfs_vol_cloud_z2p2c1
    tag:
      disk: fast
