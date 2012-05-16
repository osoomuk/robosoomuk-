# !/bin/bash 
# This script is for monitoring the robot's operating system 
if [ $UID -ne 0  ]; then
   echo 'Please login as root'
   exit 1
else 
   echo 'Youre root'
fi 

COUNTER=1
echo "Insert output file name "
  read  FAIL
while [ $COUNTER -le 5 ]
do
  echo "Amount of running threads" >> $FAIL
  ps -eo nlwp | tail -n +2 | awk '{ num_threads += $1 } END { print num_threads }'  >> $FAIL
  top -b -n 1 >> $FAIL 
  iostat -dkx >> $FAIL
  COUNTER=$(( $COUNTER + 1)) 
  sleep 60
done
echo "Testing is finished"
exit 1 
