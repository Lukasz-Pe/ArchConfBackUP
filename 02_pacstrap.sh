#!/bin/sh
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub grub-btrfs nano tldr base-devel git intel-ucode efibootmgr zsh zsh-autosuggestions zsh-syntax-highlighting
genfstab -U /mnt >> /mnt/etc/fstab
mkdir -p /mnt/home
cp -R * /mnt/home/