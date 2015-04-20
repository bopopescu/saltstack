#!/usr/bin/env python
''' Support for running check_mk_agent over salt '''
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    ''' Only load the module if check_mk_agent is installed '''
    if os.path.exists('/usr/bin/check_mk_agent'):
        return 'cmk'
    return False

def agent():
    ''' Return the output of check_mk_agent '''
    return __salt__['cmd.run']('/usr/bin/check_mk_agent')
