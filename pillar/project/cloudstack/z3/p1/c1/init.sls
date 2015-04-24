include:
  - project.cloudstack.z3.p1

cluster:
  name: z3p1c1
  hosts:
    - xs201
    - xs202
    - xs203
    - xs204
    - xs205
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/cloud/z2p1c1
    label: nfs_vol_cloud_z2p1c1
    tag:
      disk: fast
