#!/usr/bin/python
from snimpy.manager import Manager as M
from snimpy.manager import load

load("/usr/share/snmp/mibs/IF-MIB.mib")
m = M("ipmi-sw01", 'snmp-com-ro', 2)
print m.ifTable
