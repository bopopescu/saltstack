#!/bin/bash
test -f /etc/xensource-inventory || exit 0
info=$(xl info | sed -nr '/nr_cpus|nr_nodes|cores_per_socket|total_memory|free_memory/s/\s+//p')
echo $info
