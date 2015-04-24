repo_base:
  pkgrepo:
    - managed
    - name: base
    - humanname: CentOS - Base
    - mirrorlist: file:///etc/yum.repos.d/mirrors-centos
    - gpgcheck: 0
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
    - enabled: 1
    - refresh_db: True
  file:
    - managed
    - name: /etc/yum.repos.d/mirrors-centos
    - source: salt://repos/files/mirrors-centos
    - require_in:
      - pkgrepo: base

repo_updates:
  pkgrepo:
    - managed
    - name: updates
    - humanname: CentOS - Updates
    - mirrorlist: file:///etc/yum.repos.d/mirrors-centos-updates
    - gpgcheck: 0
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
    - enabled: 1
    - refresh_db: True
    - comments:
      - '#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/'
  file:
    - managed
    - name: /etc/yum.repos.d/mirrors-centos-updates
    - source: salt://repos/files/mirrors-centos-updates
    - require_in:
      - pkgrepo: updates

repo_epel:
  pkgrepo:
    - managed
    - name: epel
    - humanname: Extra Packages for Enterprise Linux $releasever - $basearch
    - mirrorlist: file:///etc/yum.repos.d/mirrors-epel
    - comments:
      - '#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/'
    - refresh_db: True
    - gpgcheck: 0
    - enabled: 1
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    - require_in:
      - pkg: python-hashlib
  file:
    - managed
    - name: /etc/yum.repos.d/mirrors-epel
    - source: salt://repos/files/mirrors-epel
    - require_in:
      - pkgrepo: epel

clean_metadata:
  module.run:
    - name: pkg.clean_metadata

refresh_db:
  module.run:
    - name: pkg.refresh_db

python-hashlib:
  pkg.installed
