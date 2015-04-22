base:
  '*':
    - cloudstack.host.{{ grains['host'] }}
    - os.{{ grains['os'] }}.602
