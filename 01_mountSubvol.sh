#!/bin/sh
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@ /dev/sda2 /mnt
mkdir -p /mnt/{boot,home,var/{log,cache/pacman/pkg},btrfs,tmp}
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@log /dev/sda2 /mnt/var/log
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@pkg /dev/sda2 /mnt/var/cache/pacman/pkg
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@tmp /dev/sda2 /mnt/tmp
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvolid=5 /dev/sda2 /mnt/btrfs
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda3 /mnt/home
swapon /dev/sda4
