#!/bin/bash 

echo "Alustame programmiga"
while true; 
do 
  dd if=/dev/zero of=/tmp/kass.txt bs=1M count=1 
  date >> /tmp/kutsu.txt
  ps  >> /tmp/kutsu.txt 
  sleep 60
done
