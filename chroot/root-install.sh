#!/bin/bash

echo "===== Installing NetworkManager"
pacman -S networkmanager networkmanager-openconnect --noconfirm 1>/dev/null
systemctl enable NetworkManager 1>/dev/null


echo "===== Installing additional"
pacman -Sqyy tree zip unzip vi zsh ncdu htop git reflector efibootmgr privoxy xclip --noconfirm 1> /dev/null

echo '=====Install bluetooth and printers'
pacman -Sq bluez bluez-utils cups cups-pdf --noconfirm 1>/dev/null
systemctl enable bluetooth.service 1>/dev/null
systemctl enable org.cups.cupsd.service 1>/dev/null

echo '=====Install docker'
pacman -Sq docker docker-compose --noconfirm 1>/dev/null
systemctl enable docker.service 1>/dev/null
usermod -a -G docker $USER_NAME

echo '=====Install aws-cli'
pacman -Sq aws-cli --noconfirm 1>/dev/null

echo '=====Install nodejs npm'
pacman -Sq nodejs npm --noconfirm 1>/dev/null

echo '=====Install virtualbox'
pacman -Sq virtualbox virtualbox-host-modules-arch virtualbox-guest-iso --noconfirm 1>/dev/null

echo '=====Install keybase'
pacman -Sq keybase --noconfirm 1>/dev/null

echo '=====Install DBeaver'
pacman -Sq dbeaver --noconfirm 1>/dev/null

echo '=====Install intellij-idea-community-edition'
pacman -Sq intellij-idea-community-edition --noconfirm 1>/dev/null

echo ===== Install aws-azure-login
curl -o /usr/local/bin/aws-azure-login https://raw.githubusercontent.com/sportradar/aws-azure-login/master/docker-launch.sh
chmod o+x /usr/local/bin/aws-azure-login

echo "===== Exiting from root install"

