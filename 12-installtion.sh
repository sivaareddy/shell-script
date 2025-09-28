#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with root previliage"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Installtion mysql is success"
else
    echo "installation mysql is failure"
fi

dnf install nginx -y

if [ $? -eq 0 ]; then
    echo "Installtion nginx is success"
else
    echo "installation nginx is failure"
fi

dnf install python3 -y

if [ $? -eq 0 ]; then
    echo "Installtion python3 is success"
else
    echo "Installtion python3 is failure"
fi