#!/bin/bash
#Connection file
echo -en "\033]0;Connection\007"

#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")

#Terminal Command
termc="xfce4-terminal -e"

#Set up device
stty -F $1 $2

#Let cat read the device $1 in the background
cat $1 >> $3 &

#Capture PID of background process so it is possible to terminate it when done
bgPid=$!

#Start input option
$termc "$pth/tcommands/screenterm.sh $1" &

#show output
$termc "$pth/tcommands/logoutput.sh" &

#show commands
$termc "$pth/tcommands/showcommands.sh" &

# Read commands from user, send them to device $1
while read cmd
do
	case $cmd in
			#Sends the return key
			rereturn)
				echo -ne "\r"
  			;;
			#Opens putty
			putty)
				sudo putty -serial $1
  			;;
			#Sends space
			sspace)
				echo " " 
			;;
			#Opens the direct terminal input window
			inoption)
  				$termc "$pth/tcommands/screenterm.sh $1" &
  			;;
			#Shows the output of the connection
			showoutput)
				$termc "$pth/tcommands/logoutput.sh" &
			;;
			#Updates the command list
			updatecommands)
  				$termc "$pth/tcommands/updatecommands.sh" &
  			;;
			#Shows the list of commands
			showcommands)
  				$termc "$pth/tcommands/showcommands.sh" &
  			;;
			#Create a new command
			newcommand)
  				$termc "$pth/tcommands/newcommand.sh" &
  			;;
			#Shows log folder
			openlogsfolder)
  				$termc "$pth/tcommands/openlogsfolder.sh" &
  			;;
			#Runs command to create new connection file
			newconnection)
				$termc "$pth/tcommands/newconnection.sh" &
			;;
			#Runs custom command file
			runcommand)
				read f
				#Opens command file and loops through until script is fully read
				while IFS='' read -r line || [ -n "$line" ]; do
					case $line in
						#Passes the command directly to the device
						pas)
							$termc "$pth/tcommands/screenterm.sh $1" &
							sleep 2
						;;
						#Sends the return key
						rereturn)
							echo -ne "\r"
  						;;
						#Sends y key
						why)
							echo -ne "y\r"
						;;
						#Sends space key
						sspace)
							echo " " 
						;;
						#Send n key
						nah)
							echo -ne "n\r"
						;;
						#Waits for set time (Seconds)
						wait-*)
							s=${line##*-}
							sleep $s
						;;
						#Sends command
						*)
							echo "$line"
						;;
					esac
					done < "$pth/rcommands/$f"
			;;
			*)
				echo "$cmd"
			;;
			esac

done > $1

# Terminate background read process
kill $bgPid
