#!/bin/bash
ID=(id -u)
if [ $ID -ne 0 ]
then
  echo "ERROR: "please run this script with root access"
  exit 1
else  
  echo "you are root user"
fi 

yum  install mysqli -y

if [ $? -ne 0 ]
then 
   echo "ERROR: "Installing mysql failed"
   exit 1
else 
  echo "installing mysql is success"
fi