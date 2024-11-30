#!/bin/bash
#Prints out the output of the connection
echo -ne "\033]0;Terminal Output\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"tcommands"/""}

#Actively reads log output
while IFS='' read -r line || [[ -n "$line" ]]; do
    tail -f $line
done < "$pth/settings/set.out"
read "a"
