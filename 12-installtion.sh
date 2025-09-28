#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R ERROR:: Please run this script with root privelege $N"
    exit 1 # failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 ........ $R FAILURE $N"
        exit 1
    else
         echo "Installing $2 ......... $G SUCCESS $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx already installed $N"
fi
dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 already installed $N"
fi