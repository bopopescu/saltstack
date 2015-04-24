include:
  - project.cloudstack.z3.p1

cluster:
  name: z3p1c2
  hosts:
    - xs211
    - xs212
    - xs213
    - xs214
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/cloud/z2p1c2
    label: nfs_vol_cloud_z2p1c2
    tag:
      disk: fast
