#!/bin/bash
#Loops through the ttys to kill them
COUNTER=0
while [  $COUNTER -lt 5 ]; do
	#Checks if can connect
	a="$(setserial -g /dev/tty$COUNTER 2>&1)"
	case $a in
		#Kills connection
		"/dev/tty$COUNTER"*)
			fuser -k /dev/tty$COUNTER
			break
		;;
		#Error hander
		"*")
			let COUNTER=COUNTER+1
		;;
	esac
done
