#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
echo "$SCRIPT_NAME"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo -e "$R ERROR:: Please run this script with root privelege $N" | tee -a $LOG_FILE
    exit 1 # failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 ........ $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
         echo "Installing $2 ......... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL already installed $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx already installed $N" | tee -a $LOG_FILE
fi
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 already installed $N" | tee -a $LOG_FILE
fi