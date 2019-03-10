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
# Set Nextion screen model
model=$(python getmodel.py;)
echo $model
tft='.tft' gz='.gz'
#clone the NextionTFT distribution from Github to /TMP/NextionTFT
git clone https://github.com/KF6S/NextionTFT
#Check to make sure that no TFT file exists at the destination
rm /usr/local/etc/$model$tft
echo "Ready to flash screen..."





