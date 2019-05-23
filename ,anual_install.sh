clear
echo "Change to /tmp directory."
sudo rm -r /tmp/Nextion.Images
cd /tmp
pwd
sudo systemctl stop cron.service > /dev/null 2>/dev/null
echo "Putting pistar into RW mode."
sudo mount -o remount,rw /
read -p "Press [Enter] key to continue to next step:" CONDITION;
echo "Getting files from github."
sudo git clone https://github.com/EA7KDO/Nextion.Images
read -p "Press [Enter] key to continue to next step:" CONDITION;
echo "Make the cpyfiles.sh script executable using chmod."
sudo chmod +x /tmp/Nextion.Images/cpyfiles.sh
read -p "Press [Enter] key to continue:" CONDITION;
echo "Execute cpyfiles script"
echo "Create Nextion_Support directory..."
read -p "Press [Enter] key to continue to next step:" CONDITION;
sudo /tmp/Nextion.Images/cpyfiles.sh
read -p "Press [Enter] key to continue to next step:" CONDITION;
echo "Copy firewall file ipv4.fw to /root folder."
sudo cp /usr/local/etc/Nextion_Support/*.fw /root
read -p "Press [Enter] key to continue to next step:" CONDITION;
sudo pistar-firewall
echo
echo
echo "Check if files are properly installed to support the Nextion Display"
echo
echo
echo "Show Firewall Rule for 5040 if it exists:"
sudo iptables -S | grep --color "5040"
echo
echo
echo "List files in /usr/local/etc/Nextion_Support"
sudo ls -l --color /usr/local/etc/Nextion_Support
echo
echo
echo "Check tft file in /usr/local/etc/"
sudo ls -l --color /usr/local/etc/NX????????.tft | grep --color "NX"
echo
echo
echo "Check to see if ipv4.fw file was copied to /root"
sudo ls -l --color /root/ipv4.fw | grep --color "ipv4.fw"
echo
echo
echo "See if Nextion.Images existes, it will be deleted from tmp after a re-boot"
sudo ls -l --color /tmp/Nextion.Images
