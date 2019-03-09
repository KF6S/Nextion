#!/bin/bash
#########################################################
#  Nextion TFT Support for Nextion screen Git Command   #
#                                                       #
#                   (c)2019 by KF6S                     #
#                                                       #
#                                                       #
#                        V0.10                          #
#                                                       #
#########################################################
# Set defaults
#model='NX4024K032'
model=$1
tft='.tft' gz='.gz'
#Put Pi file system in Read/Write Mode
sudo rpi-rw
# for testing move to /tmp 
cd /tmp
sudo rm -r /home/pi-star/NextionTFT
#clone the NextionTFT distribution from Github to /TMP/NextionTFT
git clone https://github.com/KF6S/NextionTFT
#Check to make sure that no TFT file exists at the destination
sudo rm /usr/local/etc/$model$tft
#Un-zip (tar) the TFT file to the /tmp folder from the NextionTFT folder
sudo tar xvzf NextionTFT/$model$gz
#Copy the un-tared tft file to the Nextion Driver Data directory
echo $model$tft
sudo cp /tmp/$model$tft /usr/local/etc/$model$tft
#put the file system back in Read Only Mode
rpi-ro
echo "Ready to flashing screen..."



