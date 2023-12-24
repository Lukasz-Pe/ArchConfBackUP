#!/bin/sh
#import all variables
source 01_basicData.sh
#Set timezone
ln -sf /usr/share/zoneinfo/$region/$city /etc/localtime
hwclock --systohc
./restoreSystemSettingsBackup.sh
locale-gen
mkinitcpio -P
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
mkdir -p /boot/efi/EFI/BOOT
cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
touch /boot/efi/startup.nsh
echo 'bcf boot add 1 fs0:\EFI\GRUB\grubx64.efi "GRUB bootloader"' >> /boot/efi/startup.nsh
echo 'exit' >> /boot/efi/startup.nsh
LineN=$(awk '\[multilib\]/{print NR+1;exit}' /etc/pacman.conf)
sed -i -e '\[multilib\]/s/^#//' -e $LineN' s/^#//' /etc/pacman.conf
pacman -Syy --noconfirm
systemctl enable NetworkManager
useradd -m -G wheel,video -s /bin/zsh $user
echo "Set passwords for root and $user!"