#!/bin/bash 

echo "Alustame programmiga"
while true; 
do 
  dd if=/dev/zero of=/tmp/kala.txt bs=1M count=1 
  sleep 60
done