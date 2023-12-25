#!/bin/sh
#Subvol mount
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@ $disk"3" /mnt
mkdir -p /mnt/{boot/efi,home,var/{log,cache/pacman/pkg},btrfs,tmp}
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@log $disk"3" /mnt/var/log
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@pkg $disk"3" /mnt/var/cache/pacman/pkg
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@tmp $disk"3" /mnt/tmp
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvolid=5 $disk"3" /mnt/btrfs
mount $disk"1" /mnt/boot/efi
mount $disk"4" /mnt/home
swapon $disk"2"
cd /mnt/home
git clone https://github.com/Lukasz-Pe/ArchConfBackUP.git
cd ArchConfBackUP && chmod +x *sh