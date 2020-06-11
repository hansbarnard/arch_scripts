#!/bin/bash

su hansbarnard <<EOSU

echo =======Install SDKMan
curl -s "https://get.sdkman.io" | bash  1> /dev/null
source "$HOME/.sdkman/bin/sdkman-init.sh" 1> /dev/null
sdk version

echo =======Install java
sdk install java 8.0.252-open 1> /dev/null


echo "===== Installing yay"
cd /tmp
git clone -q https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si --noconfirm 1> /dev/null
cd ~/

echo "===== Installing google-chome"
yay -Sy google-chrome --noconfirm --answerclean No --nodiffmenu  1> /dev/null

echo "===== Installing postman"
yay -Sy postman --noconfirm --answerclean No --nodiffmenu  1> /dev/null

echo "===== Installing teams"
yay -Sy teams --noconfirm --answerclean No --nodiffmenu  1> /dev/null

echo "===== Installing FreeOffice"
yay -Sy freeoffice --noconfirm --answerclean No --nodiffmenu  1> /dev/null

echo ===== Install OneDrive
yay -Sqy onedrive-abraunegg --noconfirm --answerclean No --nodiffmenu 1> /dev/null


echo ===== Install timeshift
yay -Sqy timeshift --noconfirm --answerclean No --nodiffmenu 1> /dev/null

echo ===== Install aws-azure-login
yay -Sqy aws-azure-login --noconfirm --answerclean No --nodiffmenu 1> /dev/null


EOSU
