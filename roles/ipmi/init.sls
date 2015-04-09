ipmi_modules:
  file:
    - managed
    - name: /etc/sysconfig/modules/ipmi.modules
    - source: salt://ipmi/files/ipmi.modules
    - mkdir: True
    - mode: 0755

{% if grains['os'] == 'XenServer' %}
ipmi-pkgs:
  pkg.installed:
    - names:
      - ipmiutil
      - freeipmi-ipmidetectd
      - freeipmi

ipmi_si:
  kmod.present

{% endif %}
