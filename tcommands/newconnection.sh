#!/bin/bash
#Create new custom connection file
echo -ne "\033]0;New Connection\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"tcommands"/""}

#Enter connection name
echo "Enter Connection Name (No Spaces)"
read f

#Enter connection string
echo "Enter connection string"
read c

#Writes file
sudo echo $c > "$pth/connections/$f"