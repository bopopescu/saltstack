ipmi_modules:
  file:
    - managed
    - name: /etc/sysconfig/modules/load_ipmi.modules
    - mkdir: True
    - mode 0755
    - source: salt://ipmi/files/load_ipmi.modules

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
