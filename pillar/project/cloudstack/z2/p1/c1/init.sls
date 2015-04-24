include:
  - project.cloudstack.z2.p1

cluster:
  name: z2p1c1
  hosts:
    - xs02
    - xs03
    - xs04
    - xs05
    - xs06
    - xs07
    - xs08
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/cloud/z2p1c1
    label: nfs_vol_cloud_z2p1c1
    tag:
      disk: fast
