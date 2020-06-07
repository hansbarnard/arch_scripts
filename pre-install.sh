#!/bin/bash

sed -e 's/#Color/Color/' /etc/pacman.conf >pacman.temp  #ENABLE COLOR IN PACMAN
cp pacman.temp /etc/pacman.conf 1>/dev/null

loadkeys uk
timedatectl set-ntp true
fsize=14
setfont ter-v${fsize}n
echo "FONT=ter-v${fsize}n" > font.txt

./configure_mirrors.sh



