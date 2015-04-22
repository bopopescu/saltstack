<?php
// Created by OMD hook MULTISITE_COOKIE_AUTH
//
$conf['useacl'] = 1;
$conf['authtype'] = 'multisite';
$conf['superuser'] = '@admin';
$conf['multisite']['authfile'] = '/omd/sites/site01/var/check_mk/wato/auth/auth.php';
$conf['multisite']['auth_secret'] = '/omd/sites/site01/etc/auth.secret';
$conf['multisite']['auth_serials'] = '/omd/sites/site01/etc/auth.serials';
$conf['multisite']['htpasswd'] = '/omd/sites/site01/etc/htpasswd';
?>
