#!/bin/bash

echo "===== Installing gnome"
selected_packages=$(grep -i $'^Y\s' /scripts/gnome-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_packages --noconfirm 1>/dev/null
systemctl enable gdm.service 1>/dev/null

