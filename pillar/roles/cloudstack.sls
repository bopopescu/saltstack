{% set pod_z2p201 = '192.168.201.0/25' %}
{% from netaddr import IPNetwork, IPAddress %}
{% set ipv4 = grains['ipv4'][-1] %}
{% if IPAddress(ipv4) in IPNetwork(pod_z2p201)%}
pod: z2p201c1 
{% endif %}
