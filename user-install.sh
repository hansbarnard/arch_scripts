#!/bin/bash

su hansbarnard <<EOSU

echo "===== Installing yay"
cd /tmp
git clone -q https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si --noconfirm 1> /dev/null
cd ~/

echo "===== Installing google-chome"
yay -Sy google-chrome --noconfirm 1> /dev/null


EOSU
