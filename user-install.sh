#!/bin/bash

su hansbarnard

echo "===== Installing yay"
cd /tmp
git clone https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si 1> /dev/null
cd ~/

echo "===== Installing google-chome"
yay -Sy google-chrome --noconfirm 1> /dev/null



exit