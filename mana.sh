# !/bin/bash 
echo "Start with package removal"
if [ $UID -ne 0 ]; then 
   echo "Please, login as root and execute this script again"
   exit 1
fi  
echo "This script is for managing the new operating system and it's processes(daily cron, weekly cron and monthly cron and updating)"
echo "For update and upgrade, insert u"
echo "For executing daily cron tasks, insert dc"
echo "For executing weekly cron tasks, insert wc"
echo "For executing hourly cron tasks, insert hc"
echo "For executing monthly cron tasks, insert mc"
read UP 
if [ $UP = 'u' ]; then
apt-get update
apt-get upgrade
fi 
if [ $UP = 'dc' ]; then
cd /etc/
run-parts cron.daily
fi 
if [ $UP = 'wc' ]; then
cd /etc/
run-parts cron.weekly
fi 
if [ $UP = 'mc' ]; then
cd /etc/
run-parts cron.monthly
fi 
if [ $UP = 'hc' ]; then
cd /etc/
run-parts cron.hourly
fi 
