import subprocess

def read_ipmi():
    cmd = "dmidecode -t 38 | grep IPMI && ipmitool lan print | egrep 'Subnet|Address|Gateway'"
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
    out = p.communicate()[0]
    ipmi = {}
    lines = out.splitlines()
    for line in lines:
        comps = line.split(':', 1)
        key = comps[0].strip()
        if key == 'IP Address':
            try:
                ipmi['ip'] = comps[1].strip()
            except:
                ipmi['ip'] = None
        elif key == 'IP Address Source':
            try:
                ipmi['src'] = comps[1].strip()
            except:
                ipmi['src'] = None
        elif key == 'MAC Address':
            try:
                ipmi['mac'] = comps[1].strip()
            except:
                ipmi['mac'] = None
        elif key == 'Subnet Mask':
            try:
                ipmi['netmask'] = comps[1].strip()
            except:
                ipmi['netmask'] = None
        elif key == 'Default Gateway IP':
            try:
                ipmi['defgw_ip'] = comps[1].strip()
            except:
                ipmi['defgw_ip'] = None
        elif key == 'Default Gateway MAC':
            try:
                ipmi['defgw_mac'] = comps[1].strip()
            except:
                ipmi['defgw_mac'] = None

    grains = {}
    grains['ipmi'] = ipmi
    return grains
