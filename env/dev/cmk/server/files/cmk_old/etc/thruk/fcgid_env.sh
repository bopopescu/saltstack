#!/bin/bash

. "/omd/sites/site01/.profile"

# set omd environment
export CATALYST_CONFIG="/omd/sites/site01/etc/thruk"

# execute fastcgi server
exec "/omd/sites/site01/share/thruk/script/thruk_fastcgi.pl";
