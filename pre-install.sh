#!/bin/bash

sed -e 's/#Color/Color/' /etc/pacman.conf >pacman.temp  #ENABLE COLOR IN PACMAN
cp pacman.temp /etc/pacman.conf 1>/dev/null

loadkeys uk
timedatectl set-ntp true

./configure-mirrors.sh

pacman -Sy terminus-font 1>/dev/null
fsize=14
setfont ter-v${fsize}n
echo "FONT=ter-v${fsize}n" > font.txt



