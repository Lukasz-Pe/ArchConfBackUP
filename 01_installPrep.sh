#!/bin/sh
#Partitioning
sgdisk -og $1
sgdisk -n 1:0:+250M -n 2:0:12G -n 3:0:+30G -n 4:0:0 $1
mkfs.vfat -F 32 -n EFI $1"1"
mkswap $1"2"
mkfs.btrfs -f $1"3"
mkfs.btrfs -f $1"4"
#Subvolume creation
mount $1"3" /mnt
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@tmp
btrfs sub cr /mnt/@log
btrfs sub cr /mnt/@pkg
btrfs sub cr /mnt/@snapshots
umount /mnt
#Subvol mount
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@ $1"3" /mnt
mkdir -p /mnt/{boot/efi,home,var/{log,cache/pacman/pkg},btrfs,tmp}
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@log $1"3" /mnt/var/log
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@pkg $1"3" /mnt/var/cache/pacman/pkg
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@tmp $1"3" /mnt/tmp
mount -o relatime,space_cache=v2,ssd,compress=lzo,subvolid=5 $1"3" /mnt/btrfs
mount $1"1" /mnt/boot/efi
mount $1"4" /mnt/home
swapon $1"2"
#Pacstrap and FSTAB
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub grub-btrfs nano tldr base-devel git efibootmgr zsh zsh-autosuggestions zsh-syntax-highlighting linux-headers intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
cp -R ../ArchConfBackUP /mnt/home/