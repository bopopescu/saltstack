#!/usr/bin/env python
# reference:
# https://dmsimard.com/2013/11/29/capture-output-from-parallel-execution-with-fabric/
"""
Chassis/Slot/Port  1/1/1  :
 Operational Status     : up,
 Last Time Link Changed : Fri Jun 20 11:50:54 2014,
 Number of Status Change: 15,
 Type                   : Ethernet,
 SFP/XFP                : SFP_PLUS_COPPER,
 EPP                    : Disabled,
 Link-Quality           : GOOD,
 MAC address            : e8:e7:32:0e:66:30,
 BandWidth (Megabits)   :    10000,             Duplex           : Full,
 Autonegotiation        :   0  [                              ],
 Long Frame Size(Bytes) : 9216,
 Rx              :
 Bytes Received  :       13596064351615, Unicast Frames :          12406279532,
 Broadcast Frames:               164344, M-cast Frames  :                  428,
 UnderSize Frames:                    0, OverSize Frames:                    0,
 Lost Frames     :                    0, Error Frames   :                    0,
 CRC Error Frames:                    0, Alignments Err :                    0,
 Tx              :
 Bytes Xmitted   :        5873848359867, Unicast Frames :           9688855563,
 Broadcast Frames:             41321590, M-cast Frames  :             39884891,
 UnderSize Frames:                    0, OverSize Frames:                    0,
 Lost Frames     :                    0, Collided Frames:                    0,
 Error Frames    :                    0

"""

from fabric.api import *

class ParallelCommands():
    def __init__(self, **args):
        self.hosts = args['hosts']
        self.command = args['command']

    @parallel(pool_size=10) # Run on as many as 10 hosts at once
    def parallel_exec(self):
        return run(self.command)

    def capture(self):
        with settings(hide('running', 'commands', 'stdout', 'stderr')):
            stdout = execute(self.parallel_exec, hosts=self.hosts)
        return stdout

"""
The output of each server is inside a dictionary:
{ 'root@server1': 'output', 'root@server2': 'output' }
"""

env.user = 'snmp'
hosts = ['storage-sw02']
env.passwords = {
    'snmp@storage-sw02:22': 'snmp-com-ro',
}

command = 'show interfaces | grep -B3 Number'
instance = ParallelCommands(hosts=hosts, command=command)
output = instance.capture()

lines = output['storage-sw02'].split('\n')
print "<<<<storage-sw02>>>>"
print "<<<local>>>"

for i, line in enumerate(lines):
    port = ''
    count = ''
    if line.startswith('Chassis'):
        port = line.split(' ')[2]
        count = lines[i+3].split(':')[-1].strip(',\r').strip(' ')
        lastchanged = lines[i+2].split(' ')[-1]
        print "0 link_changed_port_{0} number={1};;;; Number of Status Change: {1}".format(port, count)
print "<<<<>>>>"
