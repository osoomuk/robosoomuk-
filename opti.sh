# !/bin/bash 
echo "Start with package removal"
if [ $UID -ne 0 ]; then 
   echo "Please, login as root and execute this script again"
   exit 1
fi  

echo 'Service configuration'
chk=`/usr/bin/apt-cache policy chkconfig | grep Installed | awk '{print $2}'`
 
echo 'Checking package status.'
 
if [ $chk == '(none)' ]; then 
    apt-get install chkconfig -y 
else 
    echo 'Package is already installed.'    
fi
echo 'Disable services'
while read line
do
   mv /etc/init/$line.conf /etc/init/$line.conf.disabled
done > service.txt 


echo 'Startup processes deactivating'
cd /etc/xdg/autostart/
sudo sed --in-place 's/NoDisplay=false/NoDisplay=true/g' *.desktop
 
