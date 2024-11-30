#!/bin/bash
#Direct input to device
echo -ne "\033]0;Direct Input\007"

#Direct Input to the terminal
screen $1
