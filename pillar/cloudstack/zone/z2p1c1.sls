include:
  - cloudstack.pod.z2p1

cluster:
  name: z2p1c1
  primary_storage:
    type: nfs
    server: 192.168.11.31
    path: /vol/z2p1c1
    label: pri_z2p1c1
