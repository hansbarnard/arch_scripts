#!/bin/bash

mkdir /mnt/scripts

cp font.txt /mnt/scripts 1>/dev/null
cp post-chroot.sh /mnt/scripts
cp install-gnome.sh /mnt/scripts
cp gnome-packages-selection.txt /mnt/scripts
cp gnome-extra-packages-selection.txt /mnt/scripts
cp user-install.sh /mnt/scripts
cp user-onfiguration.sh /mnt/scripts

echo "===== Calling post chroot script"
arch-chroot /mnt /scripts/post-chroot.sh

echo "===== Installing gnome"
arch-chroot /mnt /scripts/install-gnome.sh

echo "===== Installing as user"
arch-chroot /mnt /scripts/user-install.sh

echo "===== Configuration as user"
arch-chroot /mnt /scripts/user-configuration.sh
