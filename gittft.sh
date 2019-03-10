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
#Check to make sure that NO TFT file exists at the destination
rm /usr/local/etc/$model$tft
cp /tmp/NextionTFT/$model$tft /usr/local/etc/$model$tft > msg
echo "Ready to flash screen..."





