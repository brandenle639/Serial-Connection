#!/bin/bash
#Custom tty Kill
echo -ne "\033]0;Kill Connection Menu\007"
PS3='Please enter your choice: '
options=("List Serial USB Connection" "List Serial Connection" "Kill Connecton" "Quit")
select opt in "${options[@]}"
do case $opt in
	#Lists ttyUSB Connections
	"List Serial USB Connection")
        sudo dmesg | grep ttyUSB
    ;;
	#List tty connections
    "List Serial Connection")
        sudo dmesg | grep tty
	;;
	#Kills custom tty connection
	"Kill Connecton")
	    echo "====Enter Connection Device===="
	    read c
	    fuser -k $c
	    stty -echo -F $c
	    ;;
        "Quit")
            break
        ;;
        *) echo "invalid option $REPLY";;
    esac
done
