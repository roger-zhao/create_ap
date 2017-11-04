#! /bin/bash
date

wl=$(iwconfig | awk '/wlan/ && NR==1 {print $1}')
echo $wl 
echo $wl | egrep "^wlan" >/dev/null 2>&1

SN=TEST

AP_name="RT8188EU-$SN"

if [ $? -eq 0  ]; then
        ifdown $wl
	ifconfig $wl down
	./create_ap --driver rtl871xdrv $wl eth0 -g 11.0.0.1 $AP_name 12345678 &
fi

