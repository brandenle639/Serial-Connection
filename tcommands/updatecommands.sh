#!/bin/bash
#Updates the comand list
echo -ne "\033]0;Update Commands\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Sets the main script folder
pth=${pth/"tcommands"/""}

#The output for the command list that is updated
sudo echo "====Console Commands====" > $pth/settings/lcommands
sudo echo "rereturn: Sends return key" >> $pth/settings/lcommands
sudo echo "inoption: allows for realtime typing to console (no output response in terminal)" >> $pth/settings/lcommands
sudo echo "showoutput: shows the log file" >> $pth/settings/lcommands
sudo echo "updatecommands: updates cpmmand list" >> $pth/settings/lcommands
sudo echo "showcommands: shows command list" >> $pth/settings/lcommands
sudo echo "newcommand: create new run command file" >> $pth/settings/lcommands
sudo echo "openlogsfolder: opens log folder (gives root access)" >> $pth/settings/lcommands
sudo echo "newconnection: create new connection file" >> $pth/settings/lcommands
sudo echo "putty: starts putty for the session" >> $pth/settings/lcommands
sudo echo "runcommand: runs a command file (1.runcommand 2.press 'enter' 3.command filename 4.press 'enter' 5.command runs" >> $pth/settings/lcommands
sudo echo "====Runcommand Commands====" >> $pth/settings/lcommands
sudo ls $pth/rcommands/ >> $pth/settings/lcommands
echo "Done!"
