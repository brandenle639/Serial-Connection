#!/bin/bash
#Auto Selects best tty connection based on what is communicating
echo -ne "\033]0;General Connection\007"
#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"menus"/""}
#Runs the log creations script
sudo $pth/settings/mklog.sh
COUNTER=0
td=""
#Checks to see if tty or ttyUSB (Auto Controlled)
tu="t"
#Error Control (0=False) (1=True)
e=0
#Output Counter to check max number of connections
o=5
while [  $COUNTER -lt $o ]; do
	#Loop for tty connections
	if [ "$tu" == "t" ];
	then
		#Checks to see if you can connect
		a="$(sudo setserial -g /dev/tty$COUNTER 2>&1)"
		case $a in
			#Error handler
			#Can copy to use for more errors
			"Cannot get serial info: Inappropriate ioctl for device")
				let COUNTER=COUNTER+1
				e=1
			;;
			*)
				#Keeps the counter going if there are no connections or unhandle exceptions
				let COUNTER=COUNTER+1
			;;
		esac
	fi
	#Resets counter if there was an error and switches to ttyUSB
	if [ $COUNTER = $o ] && [ $e == 1 ];
	then
		COUNTER=0
		tu="u"
	fi
	#Basicley the same loop as tty but geared towards ttyUSB
	if [ "$tu" == "u" ];
	then
		b="$(sudo setserial -g /dev/ttyUSB$COUNTER 2>&1)"
		case $b in
			"/dev/ttyUSB$COUNTER0"*)
				td="/dev/ttyUSB$COUNTER 9600"
				break
			;;
			*)
				let COUNTER=COUNTER+1
			;;
		esac
	fi
done
if [ "$td" != "" ];
then
	#Read Log Settings
	lg=""
	while IFS='' read -r line || [[ -n "$line" ]]; do
	    lg=$line
	done < "$pth/settings/set.out"
	echo "========Console Input========"
	#Runs the connection script
	echo $pth
	sudo $pth/connect.sh $td $lg
fi
