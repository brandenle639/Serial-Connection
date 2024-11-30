#!/bin/bash
#The process of looping though the ttys and killing the connections

COUNTER=0
td=""
#Controls if regular tty or ttyUSB
tu="t"
#Marker for error(s) (0=False) (1=True) 
e=0
#Number of times to loop
o=5
#Starts the count at 0 and loops through to 5
while [  $COUNTER -lt $o ]; do
	#The loop through for the normal ttys
	if [ "$tu" == "t" ];
	then
		#Checks to see if connection is there
		a="$(sudo setserial -g /dev/tty$COUNTER 2>&1)"
		case $a in
			#If doesn't exsist
			#Can add more errors as they ar found
			"Cannot get serial info: Inappropriate ioctl for device")
				let COUNTER=COUNTER+1
				e=1
			;;
			#Kills connection if exists
			"/dev/tty$COUNTER0"*)
				fuser -k /dev/tty$COUNTER
				break
			;;
			#Loops through if something is not defined
			*)
				let COUNTER=COUNTER+1
			;;
		esac
	fi
	#Switched
	if [ $COUNTER = $o ] && [ $e == 1 ];
	then
		#Resets counter and switches to ttyUSB
		COUNTER=0
		tu="u"
	fi
	#ttyUSB Loop (Same as regular tty)
	if [ "$tu" == "u" ];
	then
		#Checks for ttyUSB
		b="$(sudo setserial -g /dev/ttyUSB$COUNTER 2>&1)"
		case $b in
			#If connected
			"/dev/ttyUSB$COUNTER0"*)
				fuser -k /dev/ttyUSB$COUNTER
				break
			;;
			*)
				let COUNTER=COUNTER+1
			;;
		esac
	fi
done
