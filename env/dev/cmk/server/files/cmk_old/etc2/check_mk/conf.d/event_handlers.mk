# Define a command to run
extra_nagios_conf += r"""
  define command {
    command_name    cmk_reinventory
    command_line    $USER4$/local/bin/cmk_reinventory.sh $HOSTNAME$ $SERVICESTATE$ $SERVICESTATETYPE$ $SERVICEATTEMPT$
  }
"""

##################
## Event Handlers
##################

#extra_service_conf["event_handler_enabled"] = [
#  ( "1", ALL_HOSTS, ["serviceA","SSH"]),
#]

extra_service_conf["event_handler_enabled"] = [
  ( "1", [], ['xs201'], ['Check_MK inventory'] ),
]

extra_service_conf["event_handler"] = [
  ( "cmk_reinventory", [], ["xs201"], ['Check_MK inventory'] ),
]
