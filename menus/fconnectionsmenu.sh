#!/bin/bash
#Runs custom connection file
echo -ne "\033]0;File Connection Menu\007"
#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"menus"/""}
#Runs the make log script
sudo $pth/settings/mklog.sh
#Lists the custom connection files
echo "=====Connection Files====="
sudo ls $pth/connections/
echo "=========================="
echo "Enter Connection File Name"
read f
td=""
#Reads the connection file
while IFS='' read -r line || [ -n "$line" ]; do
	td=$line
done < "$pth/connections/$f"

#Read Log Settings
lg=""
while IFS='' read -r line || [[ -n "$line" ]]; do
    lg=$line
done < "$pth/settings/set.out"
#Runs the connection string
echo "========Console Input========"
sudo $pth/connect.sh $td $lg
