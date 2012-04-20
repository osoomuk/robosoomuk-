#!/bin/bash

echo 'Script starts'
if [ $UID -ne 0  ]; then
   echo 'Please login as root'
   exit 1
else 
   echo 'Youre root'
fi 
echo 'Check for updates'
apt-get update 
echo 'Install updates'
apt-get upgrade
echo 'Install git'
apt-get install git
echo 'Removing ffmpeg and x264'
apt-get remove ffmpeg x264 libx264-dev  
echo 'Install dependencies'
sudo apt-get install build-essential libgtk2.0-0 libgtk2.0-dev gtk2-engines-pixbuf \
libjpeg-dev libtiff4-dev libjasper-dev libopenexr-dev cmake cmake-qt-gui python-dev \
python-numpy python-sphinx libtbb-dev libeigen2-dev yasm libmp3lame-dev libfaac-dev \
libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev \
libxvidcore-dev libhighgui-dev libgtkglext1-dev libdc1394-22-dev libboost-all-dev \
qtcreator libwxbase2.8-dev libwxgtk2.8-dev wx-common checkinstall libjack-jackd2-dev \
libsdl1.2-dev libva-dev libvdpau-dev libx11-dev libxfixes-dev texi2html zlib1g-dev \
libgstreamer0.10-0 libgstreamer0.10-dev gstreamer0.10-tools \
gstreamer0.10-plugins-base libgstreamer-plugins-base0.10-dev \
gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad \
gstreamer0.10-ffmpeg libv4l-dev -y  
sleep 5 
echo 'Create directory called opencv'
mkdir ~/opencv
cd ~/opencv
git clone git://git.videolan.org/x264.git
cd x264
./configure --enable-static --enable-pic --enable-shared
make
sudo make install
cd ~/opencv
wget http://ffmpeg.org/releases/ffmpeg-0.8.10.tar.bz2
tar -xvjpf ffmpeg-0.8.10.tar.bz2
cd ffmpeg-0.8.10/
./configure --enable-gpl --enable-version3 --enable-nonfree --enable-postproc \
--enable-libfaac --enable-libopencore-amrnb --enable-libopencore-amrwb \
--enable-libtheora --enable-libvorbis --enable-libmp3lame --enable-libx264  \
--enable-libxvid --enable-x11grab --enable-swscale --enable-pic --enable-shared
make
sudo make install
cd ~/opencv
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.3.1/OpenCV-2.3.1a.tar.bz2
tar -xvjpf OpenCV-2.3.1a.tar.bz2
cd OpenCV-2.3.1/
mkdir build
cd build
cmake -D BUILD_EXAMPLES=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D WITH_OPENNI=ON -D WITH_TBB=ON ..
make 
sudo make install 
echo '/usr/local/lib' >> /etc/ld.so.conf.d/opencv.conf 
echo 'PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig export PKG_CONFIG_PATH' >> /etc/bash.bashrc
sudo ldconfig
echo 'do you wanna restart' 
read BOOT
if [ $BOOT = 'y' || $BOOT = 'Y' ]; then  
   reboot 
fi 

