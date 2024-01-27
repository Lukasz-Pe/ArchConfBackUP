#!/bin/sh
#import all variables
source ./00_basicData.sh
#Set timezone
ln -sf /usr/share/zoneinfo/$region/$city /etc/localtime
hwclock --systohc
source ./restoreSystemSettingsBackup.sh
locale-gen
mkinitcpio -P
LineN=$(awk '\[multilib\]/{print NR+1;exit}' /etc/pacman.conf)
sed -i -e '\[multilib\]/s/^#//' -e $LineN' s/^#//' /etc/pacman.conf
pacman -Syy --noconfirm
systemctl enable NetworkManager
useradd -mG wheel,video -s /bin/zsh $user
echo "Set passwords for root and $user!"
