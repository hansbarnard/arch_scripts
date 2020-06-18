#!/bin/bash

echo "===== Installing NetworkManager"
pacman -S networkmanager networkmanager-openconnect --noconfirm 1>/dev/null
systemctl enable NetworkManager 1>/dev/null


echo "===== Installing additional"
pacman -Sqyy tree zip unzip ncdu htop git reflector privoxy --noconfirm 1> /dev/null


echo '=====Install docker'
pacman -Sq docker docker-compose --noconfirm 1>/dev/null
systemctl enable docker.service 1>/dev/null
usermod -a -G docker $USER_NAME

echo '=====Install aws-cli'
pacman -Sq aws-cli --noconfirm 1>/dev/null

echo '=====Install nodejs npm'
pacman -Sq nodejs npm --noconfirm 1>/dev/null

echo '=====Install virtualbox'
pacman -Sq virtualbox --noconfirm 1>/dev/null

echo '=====Install keybase'
pacman -Sq keybase --noconfirm 1>/dev/null

echo '=====Install DBeaver'
pacman -Sq dbeaver --noconfirm 1>/dev/null

echo '=====Install intellij-idea-community-edition'
pacman -Sq intellij-idea-community-edition --noconfirm 1>/dev/null

echo "===== Exiting from root install"

