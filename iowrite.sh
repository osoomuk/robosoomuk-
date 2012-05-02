#!/bin/bash 
#This script is a tool for a monitoring computer activities durning the image processing.  
echo "Script starts"
while true; 
do 
  dd if=/dev/zero of=/tmp/kass.txt bs=1M count=1 
  date >> /tmp/kutsu.txt
  ps aux >> /tmp/kutsu.txt 
  sleep 60
done
