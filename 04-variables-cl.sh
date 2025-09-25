#!/bin/bash

echo "script name : $0"
echo "first arguments : $1"
echo "second argument : $2"
echo "All arguments as separate word : $@"
echo "All arguments as a single word : $*"
echo "Number of arguments : $#"


START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME Seconds"
