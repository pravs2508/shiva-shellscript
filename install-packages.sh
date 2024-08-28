#!/bin/bash
ID=$(id -u)
ID=(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFILE="/tmp/$0-$TIMESTAMP.log"
TIMESTAMP=$(date +%F-%H-%M-%S)
echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE

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
for package in $@
 yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$package is already installed ... $Y SKIPPING $N"
    fi
done