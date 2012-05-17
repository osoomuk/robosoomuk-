# !/bin/bash 
echo "Start with package removal"
if [ $UID -ne 0 ]; then 
   echo "Please, login as root and execute this script again"
   exit 1
fi  

echo 'Removing some packages which are not useful and using some resources'
apt-get remove --purge python-ubuntuone-client
python-ubuntuone-control-panel 
python-ubuntuone-storageprotocol 
ubuntuone-client 
ubuntuone-client-gnome 
ubuntuone-control-panel 
ubuntuone-control-panel-gtk 
ubuntuone-couch 
ubuntuone-installer 
update-manager 
update-notifier
oneconf
libubuntuone-1.0-1 
libubuntuone1.0-cil -y 

echo 'Service configuration'
chk=`/usr/bin/apt-cache policy chkconfig | grep Installed | awk '{print $2}'`
 
echo 'Checking package status.'
 
if [ $SSH == '(none)' ]; then 
    apt-get install chkconfig -y 
else 
    echo 'Package is already installed.'    
fi
echo 'Disable services'
chkconfig bluetooth off
chkconfig cron off 
chkconfig pulseaudio off

echo 'Startup processes deactivating'
cd /etc/xdg/autostart/
sudo sed --in-place 's/NoDisplay=false/NoDisplay=true/g' *.desktop
 