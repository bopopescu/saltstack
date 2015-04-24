cmk:
  plugins:
    - dir_size
    - dmi_sysinfo
    - dmraid
    - lmsensors
    - lnx_psperf
    - lnx_quota
    - mk_logwatch
    - nfsexports
    - resolve_hostname
    - runas
    - smart
    - sylo
    - 300/xen_info
  local:
    - 60/rmcping
    - 60/sysconfig
    - 60/xe_vm_list
    - 60/xs_info
    - 60/xs-tools
