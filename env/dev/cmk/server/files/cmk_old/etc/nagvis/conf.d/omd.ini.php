; <?php return 1; ?>
; -----------------------------------------------------------------
; Don't touch this file. It is under control of OMD. Modifying this
; file might break the update mechanism of OMD.
;
; If you want to customize your NagVis configuration please use the
; etc/nagvis/nagvis.ini.php file.
; -----------------------------------------------------------------

[global]
sesscookiepath="/site01/nagvis"

[paths]
base="/omd/sites/site01/share/nagvis/"
local_base="/omd/sites/site01/local/share/nagvis/"
cfg="/omd/sites/site01/etc/nagvis/"
mapcfg="/omd/sites/site01/etc/nagvis/maps/"
geomap="/omd/sites/site01/etc/nagvis/geomap/"
var="/omd/sites/site01/tmp/nagvis/"
sharedvar="/omd/sites/site01/tmp/nagvis/share/"
profiles="/omd/sites/site01/var/nagvis/profiles/"
htmlbase="/site01/nagvis"
local_htmlbase="/site01/nagvis/local"
htmlcgi="/site01/nagios/cgi-bin"

[defaults]
backend="site01"

[backend_site01]
backendtype="mklivestatus"
socket="unix:/omd/sites/site01/tmp/run/live"
