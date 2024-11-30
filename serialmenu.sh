#!/bin/bash
#The main script file
echo -ne "\033]0;Connection Menu\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")

#Menu
PS3='Please enter your choice: '
options=("Use Auto General Connection" "Use TTY General Connection" "Use USB General Connection" "Use Connection File" "Use Custom Connection" "Auto Kill tty" "Kill USB" "Kill tty" "Custom Kill tty" "Quit")

#The option Select
select opt in "${options[@]}"
do
    case $opt in
	    "Use Auto General Connection")
            sudo $pth/menus/agconnectionsmenu.sh
        ;;	
	    "Use TTY General Connection")
            sudo $pth/menus/tgconnection.sh
        ;;
	    "Use USB General Connection")
            sudo $pth/menus/ugconnection.sh
            ;;
        "Use Connection File")
            sudo $pth/menus/fconnectionsmenu.sh
            ;;
	    "Use Custom Connection")
            sudo $pth/menus/cconnectionsmenu.sh
            ;;
	    "Auto Kill tty")
	        sudo $pth/settings/attykill.sh
	        ;;
	    "Kill USB")
	        sudo $pth/settings/usbkill.sh
	        ;;
        "Kill tty")
	        sudo $pth/settings/ttykill.sh
	        ;;
        "Custom Kill tty")
	        sudo $pth/settings/cttykill.sh
	        ;;
        "Quit")
            break
            ;;
        *)
            echo "invalid option $REPLY"
        ;;
    esac
done
