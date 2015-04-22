#!/bin/bash

[ -e /omd/sites/dev/.profile ] && . /omd/sites/dev/.profile
[ -e /omd/sites/dev/.thruk   ] && . /omd/sites/dev/.thruk

# set omd environment
export CATALYST_CONFIG="/omd/sites/dev/etc/thruk"

# execute fastcgi server
exec "/omd/sites/dev/share/thruk/script/thruk_fastcgi.pl";
