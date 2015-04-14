#!/usr/bin/python
"""
    fabfile.py
    fab -R feeble,bland,badass push_key:path/to/key.pub
"""
import os
from fabric import *
from fabric.api import task
from fabric.contrib.files import append

env.key_filename = "/root/.ssh/id_rsa.pub"

env.roledefs = {
    'z2p1c1' : ['root@xs02',
                'root@xs03'],
}

def read_key_file(key_file):
    key_file = os.path.expanduser(key_file)
    if not key_file.endswith('pub'):
        raise RuntimeWarning('Trying to push non-public part of key pair')
    with open(key_file) as f:
        return f.read()

@task
def push_key(key_file=env.key_filename):
    with settings(warn_only=True):
        result = run('date')
        if result.return_code == 0: 
            print "do nothing: ssh key already deployed"
        elif result.return_code == 2: 
            key_text = read_key_file(key_file)
            append('~/.ssh/authorized_keys', key_text)

            ret = run('date')
            if result.return_code == 0: 
                print "warning: ssh key deployed failed"
        else: #print error to user
            print result
            raise SystemExit()

