#!/bin/bash

echo =======Install SDKMan
curl -s "https://get.sdkman.io" | bash  &> /dev/null
source "$HOME/.sdkman/bin/sdkman-init.sh" &> /dev/null
sdk version

echo =======Install java
sdk install java 8.0.252-open &> /dev/null
java -version

echo "===== Installing yay"
cd /tmp
git clone -q https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si --noconfirm &> /dev/null
yay --version
cd ~/

echo "===== Installing google-chome"
yay -Sy google-chrome --noconfirm --answerclean No --nodiffmenu  &> /dev/null

echo "===== Installing teams"
yay -Sy teams --noconfirm --answerclean No --nodiffmenu  &> /dev/null

echo "===== Installing FreeOffice"
yay -Sy freeoffice --noconfirm --answerclean No --nodiffmenu  &> /dev/null

echo ===== Install OneDrive
yay -Sqy onedrive-abraunegg --noconfirm --answerclean No --nodiffmenu &> /dev/null


echo ===== Install timeshift
yay -Sqy cronie timeshift --noconfirm --answerclean No --nodiffmenu &> /dev/null

echo ===== Install aws-azure-login
yay -Sqy aws-azure-login --noconfirm --answerclean No --nodiffmenu &> /dev/null


