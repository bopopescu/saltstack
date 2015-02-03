#!/bin/bash
# a check_mk-agent plugin,  print current host's object info
# TODO: bond-list message-list network-list
# time test:
#real    0m18.744s
#user    0m0.000s
#sys     0m0.060s

is_xenserver ()
{
  if [ ! -f /opt/xensource/bin/xe ];then
    exit
  fi
}

uuid ()
# print current host's uuid
{
  awk -F "'" '/INSTALLATION_UUID/ { print $2}' /etc/xensource-inventory
}

name_label ()
# print current host's name label
{
  xe host-list params=name-label --minimal uuid=$(uuid)
}

host_info ()
{
  echo "[host_info]"
  xl info | grep -v '^$' | grep -v '^$'
}

host_param_list ()
{
  echo "[host_param_list]"
  uuid=$(uuid)
  xe host-param-list uuid=$uuid | grep -v '^$'
}

host_cpu_info ()
{
  echo "[host_cpu_info]"
  xe host-cpu-info | grep -v '^$'
}

host_cpu_list ()
{
  echo "[host_cpu_list]"
  xe host-cpu-list | grep -v '^$'
}

host_cpu_param_list ()
{
  cpu_list=$(xe host-cpu-list --minimal host-uuid=$(uuid) | tr ',' ' ')
  echo "[host_cpu_param_list]"
  for cpu in $cpu_list
  do
    xe host-cpu-param-list uuid=$cpu | grep -v '^$'
  done
}

host_license_view ()
{
  echo "[host_license_view]"
  xe host-license-view | grep -v '^$'
}

pbd_list ()
{
  echo "[pbd_list]"
  uuid=$(uuid)
  xe pbd-list host-uuid=$uuid | grep -v '^$'
}

pbd_param_list ()
{
  echo "[pbd_param_list]"
  host_uuid=$(uuid)
  pbd_list=$(xe pbd-list host-uuid=$host_uuid --minimal | tr ',' ' ')
  for pbd in $pbd_list
  do
    xe pbd-param-list uuid=$pbd | grep -v '^$'
  done
}

pif_list ()
{
  echo "[pif_list]"
  uuid=$(uuid)
  xe pif-list host-uuid=$uuid | grep -v '^$'
}

pif_param_list ()
{
  echo "[pif_param_list]"
  host_uuid=$(uuid)
  pif_list=$(xe pif-list host-uuid=$host_uuid --minimal | tr ',' ' ')
  for pif in $pif_list
  do
    xe pif-param-list uuid=$pif  | grep -v '^$'
  done
}

vm_list ()
{
  echo "[vm_list]"
  uuid=$(uuid)
  xe vm-list resident-on=$uuid is-a-template=false is-control-domain=false | grep -v '^$'
}

vm_param_list ()
{
  echo "[vm_param_list]"
  host_uuid=$(uuid)
  vm_list=$(xe vm-list resident-on=$host_uuid is-a-template=false is-control-domain=false --minimal | tr ',' ' ')
  for vm in $vm_list
  do
    xe vm-param-list uuid=$vm  | grep -v '^$'
  done
}

sr_list ()
{
  echo "[sr_list]"
  name_label=$(name_label)
  xe sr-list host=$name_label | grep -v '^$'
}

sr_param_list ()
{
  echo "[sr_param_list]"
  host_name_label=$(name_label)
  sr_list=$(xe sr-list host=$host_name_label --minimal | tr ',' ' ')
  for sr in $sr_list
  do
    xe sr-param-list uuid=$sr | grep -v '^$'
  done
}

patch_list ()
{
  echo "[patch_list]"
  uuid=$(uuid)
  xe patch-list hosts:contains=$(uuid) | grep -v '^$'
}

pool_list ()
{
  echo "[pool_list]"
  xe pool-list | grep -v '^$'
}

pool_param_list ()
{
  uuid=$(xe pool-list --minimal)
  echo "[pool_param_list]"
  xe pool-param-list uuid=$uuid | grep -v '^$'
}

is_xenserver
echo "<<<xenserver>>>"
host_info
host_param_list
host_cpu_info
host_cpu_list
host_cpu_param_list
host_license_view
pbd_list
pbd_param_list
pif_list
pif_param_list
vm_list
vm_param_list
sr_list
sr_param_list
pool_list
pool_param_list
patch_list
