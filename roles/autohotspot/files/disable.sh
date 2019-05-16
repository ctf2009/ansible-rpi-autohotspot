#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

systemctl disable autohotspot
sed -i '/nohook wpa_supplicant/c\#nohook wpa_supplicant' /etc/dhcpcd.conf

echo "AutoHotspot has been disabled"
