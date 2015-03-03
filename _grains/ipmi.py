import subprocess

def read_dmi():
    p = subprocess.Popen('dmidecode -t 38 | grep -q IPMI && ipmitool lan print', stdout=subprocess.PIPE, shell=True)
    out = p.communicate()[0]
    ipmi = {}
    lines = out.splitlines()
    if lines[0].startswith('Set in Progress'):
        for line in lines:
            comps = line.split(':', 1)
            key = comps[0].strip()
            if len(comps) > 0:
                val = comps[1].strip()
            else:
                val = None
            ipmi[key] = val

    grains = {}
    grains['IPMI'] = ipmi
    return grains
