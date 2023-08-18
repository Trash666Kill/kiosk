#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as sudo"
   	exit 1
else
#
cd $PWD/Repository
#Update and Upgrade
echo "**UPDATING AND UPGRADING**"
apt update && apt upgrade -y
#DE
echo "**INSTALLING THE DESKTOP ENVIRONMENT**"
echo "1"
apt install --no-install-recommends xorg lightdm openbox feh vim -y
#Conf DE
echo "**SETTING UP THE DESKTOP ENVIRONMENT**"
printf "Port 26\nPermitRootLogin yes\nDenyUsers kiosk\nDenyGroups kiosk\n" >> /etc/ssh/sshd_config
mkdir -v /mnt/Temp
chown kiosk:kiosk /mnt/Temp
mkdir -v /etc/systemd/system/getty@tty1.service.d
cp -v autologin.conf /etc/systemd/system/getty@tty1.service.d
cp -v default.jpg /usr/share/wallpapers/
#Emperor
groupadd -r autologin
gpasswd -a kiosk autologin
rm -v /home/kiosk/.profile
cp -v profile /home/kiosk/.profile
chown kiosk:kiosk /home/kiosk/.profile
su - kiosk -c "mkdir -pv /home/kiosk/.config/openbox"
cp -v autostart.sh /home/kiosk/.config/openbox
chmod +x /home/kiosk/.config/openbox/autostart.sh
chown kiosk:kiosk /home/kiosk/.config/openbox/autostart.sh
chown kiosk:kiosk /usr/share/wallpapers/default.jpg
# VNC Server
cp -v x11vnc.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now x11vnc
echo "Enter the VNC remote access password"
x11vnc -storepasswd
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
#End
echo "End"
#
fi
