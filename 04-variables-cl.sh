#!/bin/bash

echo "script name : $0"
echo "first arguments : $1"
echo "second argument : $2"
echo "All arguments as separate word : $@"
echo "All arguments as a single word : $*"
echo "Number of arguments : $#"

echo "Enter pin number"
read PIN_NUMBER

echo "The PIN number is : $PIN_NUMBER"


START_TIME=(date +%s)

sleep 10

END_TIME=(date +%s)

echo "scropt executed time : $(($START_TIME-$END_TIME))"