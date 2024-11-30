#!/bin/bash
#Can connect to custom connection and all options are straight forward to what they do 
echo -ne "\033]0;Custom Connection Menu\007"
#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"menus"/""}
PS3='Please enter your choice: '
options=("List Serial USB Connection" "List Serial Connection" "Start Connecton" "Quit")
select opt in "${options[@]}"
do case $opt in
	#Lists ttyUSB
	"List Serial USB Connection")
        sudo dmesg | grep ttyUSB
    ;;
	#Lists all ttys
    "List Serial Connection")
    	sudo dmesg | grep tty
	;;
	#Starts the custom connection (input: /dev/tty* 9600)
	"Start Connecton")
		#Runs the log script
	    sudo $pth/settings/mklog.sh
	    echo "====Enter Connection String===="
	    read c
	    td=""
		#Opens the settings file to get the log
	    while IFS='' read -r line || [ -n "$line" ]; do
		td=$line
	    done < "$pth/settings/set.out"
	    echo "========Console Input========"
		#Runs the connection script
	    sudo $pth/connect.sh $c $td
	;;
    "Quit")
        break
    ;;
    *) echo "invalid option $REPLY";;
    esac
done
