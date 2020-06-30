#!/bin/bash

echo "===== Installing plasma desktop"
pacman -S plasma-desktop kscreen plasma-wayland-session sddm plasma-nm powerdevil partitionmanager --needed --noconfirm 1>/dev/null
systemctl enable sddm.service 1>/dev/null

echo "===== Installing plasma selected"
selected_packages=$(grep -i $'^Y\s' /scripts/plasma/plasma-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_packages --needed --noconfirm 1>/dev/null

echo "===== Installing kde apps selected"
selected_packages=$(grep -i $'^Y\s' /scripts/plasma/kde-applications-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_packages --needed --noconfirm 1>/dev/null



