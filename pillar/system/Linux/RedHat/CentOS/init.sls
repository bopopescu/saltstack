repo:
  Base:
    name: base
    baseurl:
      - mirrors.yun-idc.com/centos
      - mirrors.aliyun.com/centos
    mirrorlist: 'file:///etc/yum.repos.d/mirrors-base'
    enabled: 1
    gpgcheck: 0
    gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever'
