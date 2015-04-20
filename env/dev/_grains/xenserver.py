import subprocess

def is_xenserver():
    import os
    if os.path.isfile('/etc/xensource-invenotry'):
        return True
    else:
        return False

def read_license():
    grains = {}
    if not is_xenserver():
        return grains
    else:
        p = subprocess.Popen('xe host-license-view', stdout=subprocess.PIPE, shell=True)
        out = p.communicate()[0]
        license = {}
        lines = out.splitlines()
        if lines[0].startswith('version'):
            for line in lines:
                comps = line.split(':', 1)
                key = comps[0].strip()
                if len(comps) > 1:
                    val = comps[1].strip()
                else:
                    val = None
                license[key] = val
    
        grains['license'] = license
        return grains
