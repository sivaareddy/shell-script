#!/bin/bash

echo "All variables passed to script : $@"
echo "All variables passed to script : $#"
echo "script name : $0"
echo "Who running this ecript: $USER"
echo "which folder we are in : $PWD"
echo "current user homw direcory :$HOME"
echo "PID of the script :$$"
#& is used to below command to run in backgroun
sleep 50 &
echo "PID of the last command in backgound is :$!"