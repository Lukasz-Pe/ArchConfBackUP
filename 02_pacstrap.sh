#!/bin/sh
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub grub-btrfs nano tldr base-devel git intel-ucode efibootmgr
genfstab -U /mnt >> /mnt/etc/fstab
mkdir -p /mnt/home
cp -R * /mnt/home/