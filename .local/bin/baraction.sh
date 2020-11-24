#!/bin/bash
# baraction.sh for spectrwm status bar
# From http://wiki.archlinux.org/index.php/Scrotwm

SLEEP_SEC=5
	#spectrwm bar_print can't handle UTF-8 characters, such as degree symbol
	#Core 0:      +67.0°C  (crit = +100.0°C)
	eval $(sensors 2>/dev/null | sed s/[°+]//g | awk '/^Core 0/ {printf "CORE0TEMP=%s;", $3}; /^Core 1/ {printf "CORE1TEMP=%s;",$3}; /^fan1/ {printf "FANSPD=%s;",$2};' -)
	TEMP_STR="Tcpu=$CORE0TEMP,$CORE1TEMP F=$FANSPD"

	WLAN_ESSID=$(iwconfig wlan0 | awk -F "\"" '/wlan0/ { print $2 }')
	eval $(cat /proc/net/wireless | sed s/[.]//g | awk '/wlan0/ {printf "WLAN_QULTY=%s; WLAN_SIGNL=%s; WLAN_NOISE=%s", $3,$4,$5};' -)
	BCSCRIPT="scale=0;a=100*$WLAN_QULTY/70;print a"
	WLAN_QPCT=`echo $BCSCRIPT | bc -l`
	WLAN_POWER=`iwconfig 2>/dev/null| grep "Tx-Power"| awk {'print $4'}|sed s/Tx-Power=//`
	WLAN_STR="$WLAN_ESSID: Q=$WLAN_QPCT% S/N="$WLAN_SIGNL"/"$WLAN_NOISE"dBm T="$WLAN_POWER"dBm"

	CPUFREQ_STR=`echo "Freq:"$(cat /proc/cpuinfo | grep 'cpu MHz' | sed 's/.*: //g; s/\..*//g;')`
	CPULOAD_STR="Load:$(uptime | sed 's/.*://; s/,//g')"

	eval $(awk '/^MemTotal/ {printf "MTOT=%s;", $2}; /^MemFree/ {printf "MFREE=%s;",$2}' /proc/meminfo)
	MUSED=$(( $MTOT - $MFREE ))
	MUSEDPT=$(( ($MUSED * 100) / $MTOT ))
	MEM_STR="Mem:${MUSEDPT}%"

	echo -e "$CPULOAD_STR  $MEM_STR"
        #alternatively if you prefer a different date format
        #DATE_STR=`date +"%H:%M %a %d %b`
	#echo -e "$DATE_STR   $POWER_STR  $TEMP_STR  $CPUFREQ_STR  $CPULOAD_STR  $MEM_STR  $WLAN_STR"

	sleep $SLEEP_SEC
done
