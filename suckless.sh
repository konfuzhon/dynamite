#!/bin/bash

# Install all necessary packages
sudo xbps-install -S
sudo xbps-install base-devel dbus elogind pipewire firefox feh mpv xorg xinit libX11-devel libXft-devel libXinerama-devel libXrandr-devel nerd-fonts 

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

# Set up graphical environment
mkdir ~/.src
cd ~/.src
git clone https://github.com/konfuzhon/dwm-k
cd dwm-k
sudo make clean install
cd ..
git clone https://github.com/konfuzhon/dmenu-k
cd dmenu-k
sudo make clean install
cd ..
git clone https://github.com/konfuzhon/st-k
cd st-k
sudo make clean install
cd ..
git clone https://github.com/konfuzhon/slock-k
cd slock-k
sudo make clean install
cd ..
git clone https://github.com/konfuzhon/slstatus-k
cd slstatus-k
sudo make clean install
cd
mkdir .wallpapers
cp dynamite/chinatown.png .wallpapers
echo "pipewire &" > .xinitrc
echo "slstatus &" >> .xinitrc
echo "feh --bg-fill /home/$USER/.wallpapers/chinatown.png" >> .xinitrc
echo "exec dwm" >> .xinitrc
