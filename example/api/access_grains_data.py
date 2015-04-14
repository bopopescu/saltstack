import salt.config
import salt.loader

def custom_grains():

    __opts__ = salt.config.minion_config('/etc/salt/minion')
    __grains__ = salt.loader.grains(__opts__)
    print __grains__

custom_grains()
