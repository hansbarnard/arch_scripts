#!/bin/bash

echo "===== Installing gnome"
selected_packages=$(grep -i $'^Y\s' /scripts/gnome-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_packages --noconfirm 1>/dev/null
systemctl enable gdm.service 1>/dev/null

echo "===== Installing gnome extra"
selected_extra_packages=$(grep -i $'^Y\s' /scripts/gnome-extra-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_extra_packages --noconfirm 1>/dev/null


rm -f /usr/share/applications/avahi-discover.desktop
rm -f /usr/share/applications/bvnc.desktop
rm -f /usr/share/applications/bssh.desktop
rm -f /usr/share/applications/org.freedesktop.MalcontentControl.desktop
rm -f /usr/share/applications/stoken-gui.desktop
rm -f /usr/share/applications/stoken-gui-small
rm -f /usr/share/applications/qv4l2.desktop
rm -f /usr/share/applications/qvidcap.desktop

echo "===== Installing deepin"
pacman -S deepin deepin-editor --noconfirm 1> /dev/null

