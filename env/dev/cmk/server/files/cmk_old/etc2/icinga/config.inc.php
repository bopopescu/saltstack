<?php
// This file exists per site and configures site specific paths for
// Icinga' web pages


$cfg['cgi_config_file']='/omd/sites/dev/etc/icinga/cgi.cfg';  // location of the CGI config file

$cfg['cgi_base_url']='/dev/icinga/cgi-bin';


// FILE LOCATION DEFAULTS
$cfg['main_config_file']='/omd/sites/dev/tmp/icinga/icinga.cfg';          // default location of the main Icinga config file
$cfg['status_file']='/omd/sites/dev/tmp/icinga/status.dat';               // default location of Icinga status file
$cfg['state_retention_file']='/omd/sites/dev/spool/icinga/retention.dat'; // default location of Icinga retention file



// utilities
require_once('/omd/sites/dev/share/icinga/htdocs/includes/utils.inc.php');

?>
