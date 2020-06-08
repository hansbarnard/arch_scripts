#!/bin/bash

OPT="--color always -q --noprogressbar --noconfirm --logfile pacman-$0.log"

drive=$1
if [ -z "$drive" ]
then
  echo "Error: no drive specified."
  exit 1
fi

# Check if running EFI
if ! efibootmgr
then
  echo "Not running EFI! Please run installer using EFI mode"
  exit 2
fi


parttab=`fdisk -l /dev/$drive | grep -i "disklabel type" | awk -F: '{print $2}'`

if [ -z $parttab ]
then
  echo "===== Creating gpt and EFI System Partition on $drive"
  parted --script /dev/$drive -- mklabel gpt \
    mkpart primary fat32 1MiB 300MiB \
	  set 1 esp on
else
  echo "== A partition table already exists."
fi

esp=`fdisk -l /dev/$drive | grep -i "EFI System$" | tail -1 | awk '{print $1}'`

if [ -z $esp ]
then
  echo "Error: No EFI System partition found even though partition table exists."
  exit 1
fi

echo "===== Formatting EFI System Partition"
mkfs.fat -F32 $esp 1> /dev/null

echo "===== Creating root partition."
parted --script /dev/$drive -- mkpart primary ext4 300MiB -1MiB
rootpart=`fdisk -l /dev/$drive | grep -i "Linux filesystem$" | tail -1 | awk '{print $1}'`

if [ -z $rootpart ]
then
  echo "Error: Cannot find root partition created"
  exit 1
fi

echo "===== Formatting root partition: $rootpart"
mkfs.ext4 $rootpart 1> /dev/null
e2label $rootpart ARCH_ROOT 1> /dev/null

echo "===== Success!"


