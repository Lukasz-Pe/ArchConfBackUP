#!/bin/sh
pacstrap /mnt < pacman-light
genfstab -U /mnt >> /mnt/etc/fstab
mkdir -p /mnt/home
cp -R * /mnt/home/