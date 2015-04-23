#02:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
#02:00.1 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
#04:00.0 Ethernet controller: Intel Corporation 82599EB 10-Gigabit SFI/SFP+ Network Connection (rev 01)
#04:00.1 Ethernet controller: Intel Corporation 82599EB 10-Gigabit SFI/SFP+ Network Connection (rev 01)
{% if grains['os'] == 'XenServer' and grains['osrelease'] =='6.0.2' %}
bootutil:
  source: 'salt://BootUtil/Linux_32/bootutil'
{% endif %}
