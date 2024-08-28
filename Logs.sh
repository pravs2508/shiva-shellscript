#!/bin/bash
ID=(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $? -ne 0 ]
then 
   echo  - e "ERROR:: $2 ... $R failed $N"
   exit 1
else 
  echo -e "$2 ... $G success $N"
fi
} 

if [ $ID -ne 0 ]
then
  echo -e "$R ERROR:: please run this script with root access $N"
  exit 1
else  
  echo "you are root user"
fi 
yum install mysql -y &>> $LOGFILE 

VALIDATE $? "Installing mysql"

yum install git -y &>> $LOGFILE 

VALIDATE $? "Installing git"