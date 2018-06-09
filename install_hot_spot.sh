#! /bin/bash

sudo apt-get install -y dnsmasq hostapd
sudo cp hot_spot_files/dhcpcd.conf /etc/.
sudo cp hot_spot_files/interfaces /etc/network/.
sudo cp hot_spot_files/hostapd.conf /etc/hostapd/.
sudo cp hot_spot_files/hostapd /etc/default/.
sudo cp hot_spot_files/dnsmasq-wlan0.conf /etc/dnsmasq.d/.
sudo cp hot_spot_files/sysctl.conf /etc/.
