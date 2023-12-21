#!/bin/sh
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
./restoreSystemSettingsBackup.sh
locale-gen
mkinitcpio -P
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
