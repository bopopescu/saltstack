include:
  - project.cloudstack.z2.p201

cluster:
  name: z2p201c1
  hosts:
    - xstest1
    - xstest2
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/cloud/z2p201c1
    label: nfs_vol_cloud_z2p201c1
    tag:
      disk: fast
