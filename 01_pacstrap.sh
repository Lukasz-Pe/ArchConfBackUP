#!/bin/sh
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub grub-btrfs nano tldr base-devel git
genfstab -U /mnt >> /mnt/etc/fstab
mkdir -p /mnt/home
cp -R * /mnt/home/
#arch-chroot /mnt /bin/bash <<END
#./backup/02_installArch.sh
#END
