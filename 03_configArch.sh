#!/bin/sh
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
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
systemctl enable NetworkManager