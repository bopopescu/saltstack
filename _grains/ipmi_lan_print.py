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
                ipmi['ip'] = comps[1]
            except:
                ipmi['ip'] = None
        elif key == 'IP Address Source':
            try:
                ipmi['source'] = comps[1]
            except:
                ipmi['source'] = None
        elif key == 'MAC Address':
            try:
                ipmi['mac'] = comps[1]
            except:
                ipmi['mac'] = None
        elif key == 'Subnet Mask':
            try:
                ipmi['mask'] = comps[1]
            except:
                ipmi['mask'] = None
        elif key == 'Default Gateway IP':
            try:
                ipmi['gateway_ip'] = comps[1]
            except:
                ipmi['gateway_ip'] = None
        elif key == 'Default Gateway MAC':
            try:
                ipmi['gateway_mac'] = comps[1]
            except:
                ipmi['gateway_mac'] = None

    grains = {}
    grains['ipmi'] = ipmi
    return grains
