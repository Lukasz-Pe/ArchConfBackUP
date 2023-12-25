#!/bin/sh
#import all variables
source ./00_basicData.sh
#Partitioning
sgdisk -Z $disk
sgdisk -og $disk
sgdisk -n 1:0:+$EFIsize -n 2:0:$swapSize -n 3:0:+$sysSize -n 4:0:0 $disk -t 1:ef00
mkfs.vfat -F 32 -n EFI $disk"1"
mkswap $disk"2"
mkfs.btrfs -f $disk"3"
mkfs.btrfs -f $disk"4"
#Subvolume creation
mount $disk"3" /mnt
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@tmp
btrfs sub cr /mnt/@log
btrfs sub cr /mnt/@pkg
btrfs sub cr /mnt/@snapshots
umount /mnt
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
#Pacstrap and FSTAB
pacstrap /mnt base linux linux-firmware btrfs-progs networkmanager grub grub-btrfs nano tldr base-devel git efibootmgr zsh zsh-autosuggestions zsh-syntax-highlighting linux-headers intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
cd /mnt/home
git clone https://github.com/Lukasz-Pe/ArchConfBackUP.git
cd ArchConfBackUP && chmod +x *sh
sed -i 's/.*,subvol=\/@\t/# &/' /mnt/etc/fstab
arch-chroot /mnt