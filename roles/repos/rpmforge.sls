rpmforge_rpm:
  pkg.installed:
    - sources:
{% if grains['osarch'] == '6.0.2'%}
      - rpmforge: salt://repos/rpmforge-release-0.5.3-1.el5.rf.i386.rpm
{% elif grains['osarch'] == '6.2'%}
      - rpmforge: salt://repos/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
{% endif %}
