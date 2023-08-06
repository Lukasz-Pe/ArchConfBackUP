#!/bin/sh
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub nano tldr base-devel git
genfstab -U /mnt >> /mnt/etc/fstab
mkdir /mnt/backup
cp -R * /mnt/backup
arch-chroot /mnt /bin/bash <<END
./backup/02_installArch.sh
END