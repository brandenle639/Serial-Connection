#!/bin/bash
#Makes the new log file
echo -ne "\033]0;Make New Log\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth1=${pth/"settings"/""} 

echo "Enter Log file:"
read l
#Writes the log and sets the variable output the settings file
sudo echo "$pth1/logs/$l.log" > $pth/set.out
