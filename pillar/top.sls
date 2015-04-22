base:
  '*':
    - cloudstack.host.{{ grains['id'] }}
    - os.{{ grains['os'] }}.602
