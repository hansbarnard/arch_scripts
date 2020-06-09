#!/bin/bash

sed -e 's/#Color/Color/' /etc/pacman.conf >pacman.temp  #ENABLE COLOR IN PACMAN
cp pacman.temp /etc/pacman.conf 1>/dev/null

loadkeys uk
timedatectl set-ntp true

pacman -Sy reflector --noconfirm 1> /dev/null
reflector --country France --country Germany --country "United Kingdom" --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

pacman -Sy terminus-font --noconfirm 1> /dev/null
fsize=14
setfont ter-v${fsize}n
echo "FONT=ter-v${fsize}n" > font.txt



