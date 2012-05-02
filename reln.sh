#!/bin/bash
#This script makes uninstalling packages easier 
echo "Start with package removal"
if [ $UID -ne 0 ]; then 
   echo "Please, login as root and execute this script again"
   exit 1
fi  
while read line; 
do
   apt-get remove --purge $line; 
done < list.txt

