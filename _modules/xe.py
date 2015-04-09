#!/usr/bin/env python
''' Support for running xe command over salt '''
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    '''
    Only load the module if the host is a XenServer
    '''
    if not os.path.exists('/etc/xensource-inventory'):
        return False
    else:
        return 'xe'

def run(*args, **kargs):
    ''' Run xe *args **kargs '''
    xecmd = 'echo %s %s' % (args, str(kargs))
    return __salt__['cmd.run'](xecmd)
