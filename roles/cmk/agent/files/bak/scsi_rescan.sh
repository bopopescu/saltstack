#!/bin/bash
#Spiros Ioannou, sivann at ...
#v0.7 - Wed Mar  6 11:20:39 EET 2013


function showhelp() {
cat << 'EOT'

/\
--
\/
Usage: scsi-rescan.sh [options]
http://www.sivann.gr 

Options:
-i	interactive prompt for rescan
-m	<module> issue device rescan for all matching <module>
-l	list devices (default with following options)
-g	also show generic scsi devices
-v	also show model/vendor
-p	also show iscsi username/passwords
-s	also show /sys device path
-w	wider output than 80 columns
-r	no-header

Dislpays a list of:
*scsi hosts
*driver name per host 
*block & generic devices per host
*iscsi session IDs per host
*iscsi initiator and target names per iscsi session id.

You are given the option to rescan for new devices for a selected scsi host.
Uses /sys without any external dependencies.

EXAMPLES:
#just list devices in a wide terminal:
scsi-rescan.sh -l -g -v -p -w

#list devices and interactively prompt for rescan
scsi-rescan.sh -i 

#rescan all SATA ports of VIA controller (sata_via kernel module)
scsi-rescan.sh -m sata_via 

EOT
}

wantvendor=0
wantgeneric=0
wantwide=0
wantpass=0
wantpath=0
wantprompt=0
wantheader=1
wantmatchscan=0
wantlist=1

while getopts "hvgpwsirlm:" OPTION
do
    case $OPTION in
        h)  showhelp
            exit
            ;;
        v)  wantvendor=1 ;;
        g)  wantgeneric=1 ;;
        p)  wantpass=1 ;;
        w)  wantwide=1 ;;
        s)  wantpath=1 ;;
        i)  wantprompt=1 ;;
        r)  wantheader=0 ;;
        l)  wantlist=1 ;;
        m)  wantmatchscan=1;
            wantlist=0
            wantheader=0
            wantprompt=0
            MATCHMOD=$OPTARG
            ;;
        *)  showhelp
            exit
            ;;
  esac
done   

if [ $# -eq 0 ]; then
  showhelp
  exit
fi

#scsi host
shdir="/sys/class/scsi_host/"
sddir="/sys/class/scsi_device/"

hosts=(`ls -tr $shdir`)

echo ""


if [ $wantheader -eq "1" ]  ; then
    if [ $wantwide -eq "0" ]  ; then
      echo    "+--+------+------------+-------------------------------------------+------+"
      echo -e "|ID| Host | proc_name  |blkdev/gendev/model  (Vendor of)           |iscsi |"
      echo    "|  |      |  (module)  |                   of last device          |sessid|"
      echo    "+--+------+------------+-------------------------------------------+------+"
    else
      echo    "+--+------+------------+------------------------------------------------------------+------+"
      echo -e "|ID| Host | proc_name  | block_devices/generic_devices/model  (Vendor of)           |iscsi |"
      echo    "|  |      |  (module)  |                                    of last device          |sessid|"
      echo    "+--+------+------------+------------------------------------------------------------+------+"
    fi
fi



si="" #iscsi session info
for hi in ${!hosts[*]}
do
  h=${hosts[$hi]} #host name
  hn=`echo "$h"|sed 's/[a-z]//g'` #host number
  procname=`cat $shdir/$h/proc_name`
  #devices=`ls -LdC /sys/class/scsi_device/${hn}* |xargs -n 1 basename`
  #blockdevs=`/bin/ls -L ${sddir}${hn}:*/device/block 2>/dev/null|grep -v block|tr '\n' ' '|sed 's/[ ]\+/ /g'  `
  #gendevs=`/bin/ls -L ${sddir}${hn}:*/device/scsi_generic 2>/dev/null |grep -v gener|tr '\n' ' '|sed 's/[ ]\+/ /g'  `
  sessions=`ls -dL  ${shdir}${h}/device/session* 2>/dev/null|xargs -n 1 basename 2>/dev/null|sed 's/[a-z]//g'`
  hdirs=`/bin/ls -dL ${sddir}${hn}:*/ 2>/dev/null|tr '\n' ' '` #host directories


  if [ "$procname" = "$MATCHMOD" ]; then
      echo "Issuing rescan, for driver $procname,  host $h"
      scanfile=${shdir}${h}/scan
      echo "- - -" > $scanfile
  fi

  vendor=""
  model=""
  block=""
  bdev=""
  for hdir in $hdirs ; do
    hdir=`echo $hdir|sed 's/[ ]\+//g'`
    vendor=`cat "$hdir/device/vendor" 2>/dev/null|sed -e 's/[ ]\+/ /g' -e 's/ $//'`
    model=`cat "$hdir/device/model" 2>/dev/null|sed -e 's/[ ]\+/ /g' -e 's/ $//'`
    block=`ls -L "$hdir/device/block" 2>/dev/null|grep -v block|tr '\n' ' '|sed -e 's/[ ]\+/ /g' -e 's/ $//'`
    scsigen=`ls -L "$hdir/device/scsi_generic" 2>/dev/null|grep -v block|tr '\n' ' '|sed -e 's/[ ]\+/ /g' -e 's/ $//'`
    bdev="${bdev} ${block}"
    if [ $wantgeneric -eq "1" ]  ; then
      bdev="$bdev|${scsigen}"
    fi
    if [ $wantvendor -eq "1" ]  ; then
      bdev="$bdev|${model}"
    fi
    if [ $wantpath -eq "1" ]  ; then
      bdev="$bdev|${hdir}"
    fi
    bdev="${bdev} "
  done
  if [ $wantvendor  -eq "1"  ]  ; then
    bdev="$bdev ${vendor}"
  fi
  bdev=`echo "$bdev"|sed -e 's/[ ]\+/ /g' `

  for s in $sessions ; do
    iname="";tname="";
    tname=`cat ${shdir}${h}/device/session${s}/iscsi_session/session${s}/targetname 2>/dev/null`
    iname=`cat ${shdir}${h}/device/session${s}/iscsi_session/session${s}/initiatorname  2>/dev/null`
    uname=`cat ${shdir}${h}/device/session${s}/iscsi_session/session${s}/username  2>/dev/null`
    pname=`cat ${shdir}${h}/device/session${s}/iscsi_session/session${s}/password  2>/dev/null`
    sname=`cat ${shdir}${h}/device/session${s}/iscsi_session/session${s}/state  2>/dev/null`
    hipaddr=`cat ${shdir}${h}/device/iscsi_host/${h}/ipaddress  2>/dev/null`
    tipaddr=`cat ${shdir}${h}/device/session${s}/connection*/iscsi_connection/connection*/address  2>/dev/null`

    ilen="${#iname}"
    if [ $ilen -gt 1 ] ; then
      #si="$s:$iname -> ${tname}_NL_${si}"
      if [ $wantpass -eq "1" ]  ; then
	si="$s: ${hipaddr}/${iname} -> ${uname}:${pname}@${tipaddr}/${tname}_NL_${si}"
      else
	si="$s: ${hipaddr}/${iname} -> ${tipaddr}/${tname}_NL_${si}"
      fi
    fi
  done


if [ $wantlist -eq "1" ]  ; then
    if [ $wantwide -eq "0" ]  ; then
      printf "|%2s|%-6s|%-12s|%-43s|%-6s|\n" "$hi" "$h" "$procname" "$bdev" "$sessions"
    else
      printf "|%2s|%-6s|%-12s|%-60s|%-6s|\n" "$hi" "$h" "$procname" "$bdev" "$sessions"
    fi
      #printf "|%3s |%-6s|%-12s|%-25s|%-25s|%-6s|\n" "$hi" "$h" "$procname" "$blockdevs" "$gendevs" "$sessions"
fi


done


if [ $wantheader -eq "1" ]  ; then
    if [ $wantwide -eq "0" ]  ; then
      echo    "+--+------+------------+-------------------------------------------+------+"
    else
      echo    "+--+------+------------+------------------------------------------------------------+------+"
    fi
fi


if [ $wantheader -eq "1" ]  ; then
    echo "iscsi session id: ip/initiator->ip/target :"
fi
echo $si|sed 's/_NL_/\n/g'

if [ $wantprompt -eq "1" ]  ; then
    echo ""
    read -p "Enter row ID (0,1,2,..) to rescan:"
    if ! [[ "$REPLY" =~ ^[0-9]+$ ]] ; then
       exec >&2; echo "not a number,aborting"; exit 1
    fi
fi

scanfile="$shdir/"${hosts[$REPLY]}/scan

if [ ! -e "$scanfile" ] ; then 
  echo "$scanfile does not exist";
  exit
fi

echo "- - -" > $scanfile

