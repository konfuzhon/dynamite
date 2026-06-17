#!/bin/bash

# Install all necessary packages
sudo xbps-install -S
sudo xbps-install base-devel dbus elogind pipewire NetworkManager firefox noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji kde-plasma dolphin konsole discover mpv okular plasma-browser-integration

# Set up xbps-src
cd
git clone https://github.com/konfuzhon/void-packages.git

# Set up audio
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
mkdir -p ~/.config/autostart
cp pipewire.desktop ~/.config/autostart

# Network
sudo sv down dhcpcd
sudo sv down wpa_supplicant
sudo rm /var/service/dhcpcd
sudo rm /var/service/wpa_supplicant
sudo ln -s /etc/sv/NetworkManager /var/service/

# Set up graphical environment
mkdir Pictures 
cp dynamite/chinatown.png Pictures
