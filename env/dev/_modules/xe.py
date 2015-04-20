"""
emulate XenServer command: xe
"""
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    '''
    Only load the module if the OS is XenServer
    '''
    if os.path.exists('/etc/xensource-inventory'):
        return 'xe'
    return False

def run(*args, **kargs):
    ''' Run xe *args **kargs '''
    xecmd = 'echo %s %s' % (args, str(kargs))
    return __salt__['cmd.run'](xecmd)
