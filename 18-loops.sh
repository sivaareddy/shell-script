#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE=($LOGS_FOLDER/$SCRIPT_NAME.log) # /var/log/shell-script/18-loops.log

mkdir -p $LOGS_FOLDER
echo "Script execution started at : $(date) " | tee -a $LOG_FILE

#checking the user has root previlege or not
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root previlege"
    exit 1 # failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Installing $2 .... $R FAILURE $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

# $@ means getting all arguments 

for package in $@
do
    # check package is already installed or not
    dnf list installed $package | tee -a $LOG_FILE

    if [ $? -ne 0 ]; then
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $Y SKIPPING $N"
    fi
done

