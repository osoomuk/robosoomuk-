# !/bin/bash 

echo "Start with package removal"
if [ $UID -ne 0 ]; then 
   echo "Please, login as root and execute this script again"
   exit 1
fi  

echo 'Taking out some not needed packages'
while read line; do 
       echo $line
       apt-get remove --purge $line 
done > list.txt 
echo 'Uninstall completed'
exit 1

