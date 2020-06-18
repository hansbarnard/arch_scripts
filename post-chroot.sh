#!/bin/bash

pacman -Syyu --noconfirm 1>/dev/null

echo "===== Installing Intel-ucode"
pacman -S intel-ucode --noconfirm 1>/dev/null

echo "===== Installing display driver"
lspci | grep -iq NVIDIA  && pacman -S nvidia --noconfirm 1> /dev/null #NVIDIA
lspci | grep -iq innotek && pacman -S virtualbox-guest-utils --noconfirm 1> /dev/null #VIRTUALBOX

echo "===== Installing NetworkManager"
pacman -S networkmanager networkmanager-openconnect --noconfirm 1>/dev/null
systemctl enable NetworkManager 1>/dev/null


echo "===== Installing additional"
pacman -Sqyy tree zip unzip nano ncdu htop git reflector privoxy --noconfirm 1> /dev/null

echo "===== Installing all fonts"
pacman -Sqyy all-repository-fonts --noconfirm 1> /dev/null


echo '===== Setting up clock'
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo "===== Setting up locale"
LANG="en_GB.UTF-8"
LAYOUT="uk"
echo "$LANG UTF-8" >> /etc/locale.gen
locale-gen &>/dev/null
echo "LANG=$LANG" >> /etc/locale.conf
echo "KEYMAP=$LAYOUT" >> /etc/vconsole.conf
cat /scripts/font.txt >> /etc/vconsole.conf


echo '===== Creating hosts and hostname'
HNAME=hans-arch
echo $HNAME > /etc/hostname
echo '127.0.0.1 localhost' >>/etc/hosts
echo '::1 localhost' >>/etc/hosts
echo "127.0.1.1 ${HNAME}.local ${HNAME}" >>/etc/hosts

echo '===== Installing bootloader'
bootctl install &>/dev/null
rootdrive=$(df /|tail -n 1|awk '{print $1}')
uuid=$(blkid $rootdrive|awk '{print $3}')
echo 'timeout 3'>/boot/loader/loader.conf
echo 'default arch'>>/boot/loader/loader.conf
echo 'title Arch Linux Hans' > /boot/loader/entries/arch.conf
echo 'linux /vmlinuz-linux' >> /boot/loader/entries/arch.conf
echo 'initrd /intel-ucode.img' >> /boot/loader/entries/arch.conf
echo 'initrd /initramfs-linux.img' >> /boot/loader/entries/arch.conf
echo "options root=${uuid} rw" >> /boot/loader/entries/arch.conf


echo "===== Setting up accounts"
echo "root:changeme" | chpasswd
USER_NAME=hansbarnard
useradd -m "$USER_NAME"
echo "$USER_NAME:changeme" | chpasswd
echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL">"/etc/sudoers.d/$USER_NAME"

echo '===== Improving MAKEFLAG for multicore CPU'
echo 'MAKEFLAGS="-j $(nproc)"' >> /etc/makepkg.conf

echo '===== Enabling SSHD'
systemctl enable sshd 1>/dev/null


echo '=====Install docker'
pacman -Sq docker docker-compose --noconfirm 1>/dev/null
systemctl enable docker.service 1>/dev/null
usermod -a -G docker $USER_NAME

echo '=====Install aws-cli'
pacman -Sq aws-cli --noconfirm 1>/dev/null

echo '=====Install nodejs npm'
pacman -Sq nodejs npm --noconfirm 1>/dev/null

echo '=====Install virtualbox'
pacman -Sq virtualbox --noconfirm 1>/dev/null

echo '=====Install keybase'
pacman -Sq keybase --noconfirm 1>/dev/null

echo '=====Install DBeaver'
pacman -Sq dbeaver --noconfirm 1>/dev/null

echo '=====Install intellij-idea-community-edition'
pacman -Sq intellij-idea-community-edition --noconfirm 1>/dev/null



echo "===== Exiting from chroot"

