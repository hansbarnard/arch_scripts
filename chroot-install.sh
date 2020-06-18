#!/bin/bash

cp -R "`dirname "$0"`/chroot" /mnt/scripts

cp font.txt /mnt/scripts 1>/dev/null

echo "===== Calling root configure"
arch-chroot /mnt /scripts/proot-configure.sh

echo "===== Calling root install"
arch-chroot /mnt /scripts/root-install.sh

echo "===== Installing gnome"
arch-chroot /mnt /scripts/gnome/install-gnome.sh

echo "===== Installing deepin"
arch-chroot /mnt /scripts/deepin/install-deepin.sh

echo "===== Installing plasma"
arch-chroot /mnt /scripts/plasma/install-plasma.sh

echo "===== Installing as user"
arch-chroot /mnt su - hansbarnard -c /scripts/user-install.sh

