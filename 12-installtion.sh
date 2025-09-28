#!/bin/bash

USERID=$(id -u)

iif [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MySQL is failure"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx is failure"
    exit 1
else
    echo "Installing nginx is SUCCESS"
fi

dnf install python3 -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx is failure"
    exit 1
else
    echo "Installing nginx is SUCCESS"
fi