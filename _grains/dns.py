def get_config():
    import commands
    cmd = "egrep '^[a-z]' /etc/resolv.conf"
    data=commands.getoutput(cmd)
    data = data.split('\n')
    config = {}
    nameservers = []
    for line in data:
        line = line.strip()
        key, val = line.split()
        if key == 'nameserver':
            nameservers.append(val)
        elif key == 'domain':
            config['domain'] = val
        elif key == 'search':
            config['search'] = val
    config['nameserver'] = nameservers
    grains = {}
    grains['dns'] = config
    return grains
