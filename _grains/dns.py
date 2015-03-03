def get_config():
    import commands
    cmd = "egrep '^[a-z]' /etc/resolv.conf"
    data=commands.getoutput(cmd)
    data = data.split('\n')
    nameservers = []
    for line in data:
        line = line.strip()
        key, val = line.split()
        if key == 'nameserver':
            nameservers.append(val)
    grains = {}
    grains['nameservers'] = nameservers
    return grains
