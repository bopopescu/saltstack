# Written by WATO
# encoding: utf-8

if_inventory_pad_portnumbers = False
notification_logging = 2
if_inventory_uses_alias = True
inventory_check_interval = 5
if_inventory_uses_description = False
notification_service_body = u'Service:  $SERVICEDESC$\nState:    $LASTSERVICESTATE$ -> $SERVICESTATE$ ($NOTIFICATIONTYPE$)\nCommand:  $SERVICECHECKCOMMAND$\nOutput:   $SERVICEOUTPUT$\nPerfdata: $SERVICEPERFDATA$\n$LONGSERVICEOUTPUT$\nService info: $SERVICEURL$\n'
notification_common_body = u'Host:     $HOSTNAME$\nAlias:    $HOSTALIAS$\nAddress:  $HOSTADDRESS$\nHost info: NAGIOS__HOSTLOCATION$\nUUID: $NAGIOS__HOSTUUID$'
