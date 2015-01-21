#!/usr/bin/env python
''' Support for running ipmitool over salt '''
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    '''
    Only load the module if the host with BMC/IPMI Device,
    and ipmitool is installed,
    with kernel module ipmi_si is loaded,     
    '''
    if os.path.exists('/usr/bin/ipmitool'):
        return 'ipmi'
    return False

def lan_print(cmd):
    ''' Return the output of ipmitool lan CMD '''
    return __salt__['cmd.run']('ipmitool lan %s' % cmd)
