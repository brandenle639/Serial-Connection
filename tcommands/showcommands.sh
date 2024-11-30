#!/bin/bash
#Displays all the commands that can be used
echo -ne "\033]0;Commands List\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")

#Reads the command list text file
while IFS='' read -r line || [ -n "$line" ]; do
    echo $line
done < "$pth/settings/lcommands"
read "a"
