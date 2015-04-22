# Written by Multisite UserDB
# encoding: utf-8

contacts.update(
{'omdadmin': {'alias': u'omdadmin',
              'contactgroups': ['all'],
              'email': 'zhanghu@gdtianren.com',
              'host_notification_options': 'durfs',
              'notification_method': ('flexible',
                                      [{'disabled': False,
                                        'host_events': ['d',
                                                        'u',
                                                        'r',
                                                        'f',
                                                        's',
                                                        'x'],
                                        'parameters': [],
                                        'plugin': 'debug',
                                        'service_events': ['w',
                                                           'u',
                                                           'c',
                                                           'r',
                                                           'f',
                                                           's',
                                                           'x'],
                                        'timeperiod': '24X7'}]),
              'notification_period': '24X7',
              'notifications_enabled': True,
              'pager': '15117985354',
              'service_notification_options': 'wucrfs'}}
)
