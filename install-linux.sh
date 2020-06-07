#!/bin/bash

echo "===== Mounting file systems"
drive=$1
if [ -z "$drive" ]
then
  echo "Error: no drive specified."
  exit 1
fi

esp=`fdisk -l /dev/$drive | grep -i "EFI System$" | tail -1 | awk '{print $1}'`
echo "== esp: $esp"
rootpart=`fdisk -l /dev/$drive | grep -i "Linux filesystem$" | tail -1 | awk '{print $1}'`
echo "== rootpart: $rootpart"

umount -R /mnt &>/dev/null
mount $rootpart /mnt
mkdir /mnt/boot  
mount $esp /mnt/boot

echo "===== Refreshing repositories"
pacman -Syy 1> /dev/null
echo "===== Installing base and linux packages"
pacstrap /mnt base linux linux-firmware 1> /dev/null
#echo "===== Installing additional"
#pacstrap /mnt tree zip unzip nano ncdu htop 1> /dev/null
echo "===== Installing custom fonts"
pacstrap /mnt terminus-font 1> /dev/null
echo "===== Installing SSH and sudo"
pacstrap /mnt openssh sudo 1> /dev/null

echo "===== Generate fstab file"
genfstab -U /mnt >> /mnt/etc/fstab

