#!/bin/bash
airmon-ng check kill
sudo systemctl restart network-manager
ifconfig wlan0 down
iwconfig wlan0 mode monitor
iw reg set BO
ifconfig wlan0 up
iwconfig wlan0 channel 11
iwconfig wlan0 txpower 27
airodump-ng wlan0
sleep 30
pgrep airodump-ng
echo "Prcoesses to Kill?"
read Processes
kill + "$Processes"
echo "Enter BSSID"
read BSSID
echo "Enter Channel"
read CH
airodump-ng --bssid + "$BSSID" -c + "$CH" wlan0
