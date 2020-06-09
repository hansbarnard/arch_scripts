#!/bin/bash


echo "===== Installing yay"
cd /tmp
git clone https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si 1> /dev/null
cd ~/

echo "===== Installing google-chome"
yay -S google-chrome --noconfirm 1> /dev/null



