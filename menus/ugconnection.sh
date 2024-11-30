#!/bin/bash
#Auto connect to a tty connection
echo -ne "\033]0;General Connection\007"
#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"menus"/""}
#Runs the make log script
sudo $pth/settings/mklog.sh
COUNTER=0
td=""
while [  $COUNTER -lt 5 ]; do
	#Checks to see if can connect to ttyUSB
	a="$(setserial -g /dev/ttyUSB$COUNTER 2>&1)"
	case $a in
		#If connected
		"/dev/ttyUSB$COUNTER"*)
			td="/dev/ttyUSB$COUNTER 9600"
			break
		;;
		#All other unhandled errors
		"*")
			let COUNTER=COUNTER+1
		;;
	esac
done
if [ "$td" != "" ];
then
	#Read Log Settings
	lg=""
	while IFS='' read -r line || [[ -n "$line" ]]; do
	    lg=$line
	done < "$pth/settings/set.out"
	echo "========Console Input========"
	#Runs connection script
	sudo $pth/connect.sh $td $lg
fi
