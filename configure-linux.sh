#!/bin/bash

mkdir /mnt/scripts

cp font.txt /mnt/scripts 1>/dev/null
cp post-chroot.sh /mnt/scripts
cp install-gnome.sh /mnt/scripts
cp gnome-packages-selection.txt /mnt/scripts
cp gnome-extra-packages-selection.txt /mnt/scripts
cp deepin-extra-packages-selection.txt /mnt/scripts
cp user-install.sh /mnt/scripts

echo "===== Calling post chroot script"
arch-chroot /mnt /scripts/post-chroot.sh

echo "===== Installing gnome"
arch-chroot /mnt /scripts/install-gnome.sh

echo "===== Installing deepin"
arch-chroot /mnt /scripts/install-deepin.sh

echo "===== Installing as user"
arch-chroot /mnt su - hansbarnard -c /scripts/user-install.sh

