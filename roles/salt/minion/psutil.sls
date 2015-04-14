{%
set psutil = salt['grains.filter_by']({
  'XenServer': {'name': 'python26-psutil'},
  'CentOS': {'name': 'python-psutil'},
  'Ubuntu': {'name': 'python-psutil'},
  }, default='XenServer'
)
%}

psutil:
  pkg:
    - installed
    - name: {{ psutil.name }}
