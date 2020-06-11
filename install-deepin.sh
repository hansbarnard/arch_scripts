#!/bin/bash

echo "===== Installing deepin"
pacman -S deepin --noconfirm 1>/dev/null

echo "===== Installing deepin extra"
selected_extra_packages=$(grep -i $'^Y\s' /scripts/deepin-extra-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_extra_packages --noconfirm 1>/dev/null


