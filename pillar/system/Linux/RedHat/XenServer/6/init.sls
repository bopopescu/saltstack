{% if grains['osmajorrelease'] == '0.2' %}
osarch: i386
license_file: "salt://roles/XenServer/files/xs602.xslic"
patches:
  - XS602E002
  - XS602E006
  - XS602E009
  - XS602E010
  - XS602E019
  - XS602E024
  - XS602E033
{% endif %}
