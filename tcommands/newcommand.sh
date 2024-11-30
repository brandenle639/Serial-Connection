#!/bin/bash
#Creates new command file for configuring devices
echo -ne "\033]0;New Command\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"tcommands"/""}

#Enter command title
echo "Enter Command File Name (No spaces)"
read i

#opens script file for edit
sudo gedit "$pth/rcommands/$i"

#outputs that script edit is done
echo "done"
