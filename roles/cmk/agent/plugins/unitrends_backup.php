#!/usr/bin/php
<?php
print "<<<unitrends_backup:sep(124)>>>\n";
$conn = "port=5432 dbname=bpdb user=postgres";
$db = pg_connect($conn);

$query = "SELECT
            schedule_id, a.type AS app_type
          FROM
            bp.schedules AS s
          JOIN
            bp.application_lookup AS a USING(app_id)
          WHERE
            enabled=true AND email_report=true
          ORDER BY s.name";
$res = pg_query($db, $query);

$start = time() - (24 * 3600);
$in = array("start_time" => $start);
bp_bypass_cookie(3, 'schedule_report');

while ($obj = pg_fetch_object($res)) {
	if ($obj->app_type == "Archive")
            continue;

	$in["schedule_id"] = (int)$obj->schedule_id;
	$ret = bp_get_schedule_history($in);
	if (empty($ret[0]["backups"]))
            continue;

        print "HEADER|".
                $ret[0]["schedule_name"]."|" .
                $ret[0]["application_name"]."|".
                $ret[0]["schedule_description"]."|".
                $ret[0]["failures"]."\n";

	foreach($ret[0]["backups"] as $trash => $backup) {
            foreach($backup as $row) {

                $name = $row["primary_name"];
                switch($ret[0]["app_type"]){
                    case "SQL Server":
                        $name .= "/".$row["secondary_name"];
                    break;

                    case "VMware":
                        $name .= ", VM ".$row["secondary_name"];
                    break;
                    }

                    $backup_type = $row["type"];

                    if (!isset($name))
                        $name = $backup_tyoe;

                    $backup_no = (isset($row["backup_id"])) ? $row["backup_id"] : "N/A" ;

			print "$name|$backup_no|$backup_type|".$row['description']."\n";
		}
	}
}
pg_free_result($res);
bp_destroy_cookie();
?>
