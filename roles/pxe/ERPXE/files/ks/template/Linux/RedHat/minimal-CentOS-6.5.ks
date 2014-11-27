# 必须按照顺序写配置，%pre不能置于前面，获取install.img后才会执行%pre脚本
lang en_US.UTF-8
keyboard us
url --url=http://192.168.31.245/os/Linux/RedHat/CentOS/x86_64/6.5
text
install
bootloader --location=mbr --driveorder=xvda --append=" rhgb crashkernel=auto quiet"
timezone --utc Asia/Shanghai
firewall --disabled
authconfig --enableshadow --passalgo=sha512
selinux --disabled
reboot

%include /tmp/password.ks
%include /tmp/disk.ks
%include /tmp/lvm.ks
%include /tmp/pkg-minimal.ks

%pre --interpreter /usr/bin/python
import socket
import os

print "Hostname"
print socket.gethostbyaddr( os.popen("ifconfig").readlines()[1].split()[1][5:])[0][0];
ipaddr = os.popen("ifconfig").readlines()[1].split()[1][5:]
hostname = socket.gethostbyaddr(ipaddr)[0]
host = hostname.split('.')[0]

def get_swap_size():
    import re
    with open('/proc/meminfo', 'r') as f:
        line = f.readline()
        line = re.sub(' +', ' ', line)
        mem_total = line.split(' ')
        size_mb = int(mem_total[1].strip(' ')) / 1024 * 2
        return size_mb

def get_lvm_ks():
    swap_size = get_swap_size()
    cfg = '''
part /boot --fstype=ext4 --size=500
part pv.system --grow --size=1
volgroup system --pesize=4096 pv.system
logvol swap --name=lv_swap --vgname=system --size={0}
logvol / --fstype=ext4 --name=lv_root --vgname=system --size=1 --grow
'''.format(swap_size)

    with open('/tmp/lvm.ks', 'w') as f:
        f.write(cfg)

get_lvm_ks()


f = file("/tmp/network","w")
if os.path.exists ("/proc/sys/net/ipv4/conf/eth0"):
	f.write ("network --bootproto=dhcp --device=eth0\n")
else:	
	f.write ("network --bootproto=dhcp --device=eth1\n")
f.close

url = 'wget http://192.168.11.8/pxe/ks/template/Linux/RedHat'

# Get config files for machine.configfilename
for file in ['disk', 'password', 'pkg-minimal']:
	print("%s/%s.ks -O /tmp/%s.ks" % (url,file,file))
	os.popen("%s/%s.ks -O /tmp/%s.ks" % (url,file,file)).readlines()
	# Otherwise get default file
#	if not os.path.exists ("/tmp/%s.ks" % file):
#		print("%s/%s/%s.%s -O /tmp/%s" % (url,file,file,"default",file))
#		os.popen("%s/%s/%s.%s -O /tmp/%s" % (url,file,file,"default",file)).readlines()
%end

%post
#!/bin/bash
#sed -i '/initdefault:/s/3/5/' /etc/inittab
#eject