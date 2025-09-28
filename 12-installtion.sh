#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root previliage"
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Installtion mysql is success"
else
    echo "installation my sql is failure"
fi