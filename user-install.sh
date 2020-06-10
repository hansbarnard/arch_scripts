#!/bin/bash

su hansbarnard <<EOSU

echo "===== Installing yay"
cd /tmp
git clone -q https://aur.archlinux.org/yay.git 1> /dev/null
cd yay
makepkg -si --noconfirm 1> /dev/null
cd ~/

echo "===== Installing google-chome"
yay -Sy google-chrome --noconfirm --answerclean No --nodiffmenu  1> /dev/null

echo =======Install SDKMan
yay -Sqy sdkman --noconfirm --answerclean No --nodiffmenu 1> /dev/null

echo =======Install java
sdk install java 8.0.252-open

echo =======Install timeshift
yay -Sqy timeshift --noconfirm --answerclean No --nodiffmenu 1> /dev/null


EOSU
