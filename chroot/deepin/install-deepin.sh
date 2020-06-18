#!/bin/bash

echo "===== Installing deepin"
pacman -S deepin --needed --noconfirm 1>/dev/null

echo "===== Installing deepin extra"
selected_extra_packages=$(grep -i $'^Y\s' /scripts/deepin/deepin-extra-packages-selection.txt | awk -v ORS=' ' -F'\t' '{print $2}' )
pacman -S $selected_extra_packages  --needed --noconfirm 1>/dev/null


