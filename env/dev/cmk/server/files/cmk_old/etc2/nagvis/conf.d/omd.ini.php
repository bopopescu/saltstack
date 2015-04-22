; <?php return 1; ?>
; -----------------------------------------------------------------
; Don't touch this file. It is under control of OMD. Modifying this
; file might break the update mechanism of OMD.
;
; If you want to customize your NagVis configuration please use the
; etc/nagvis/nagvis.ini.php file.
; -----------------------------------------------------------------

[global]
sesscookiepath="/dev/nagvis"

[paths]
base="/omd/sites/dev/share/nagvis/"
local_base="/omd/sites/dev/local/share/nagvis/"
cfg="/omd/sites/dev/etc/nagvis/"
mapcfg="/omd/sites/dev/etc/nagvis/maps/"
geomap="/omd/sites/dev/etc/nagvis/geomap/"
var="/omd/sites/dev/tmp/nagvis/"
sharedvar="/omd/sites/dev/tmp/nagvis/share/"
profiles="/omd/sites/dev/var/nagvis/profiles/"
htmlbase="/dev/nagvis"
local_htmlbase="/dev/nagvis/local"
htmlcgi="/dev/nagios/cgi-bin"

[defaults]
backend="dev"

[backend_dev]
backendtype="mklivestatus"
socket="unix:/omd/sites/dev/tmp/run/live"
