#!/bin/bash

mkdir /mnt/scripts

cp font.txt /mnt/scripts 1>/dev/null
cp post-chroot.sh /mnt/scripts
cp user-install.sh /mnt/scripts

echo "===== Calling post chroot script"
arch-chroot /mnt /scripts/post-chroot.sh
