#!/bin.sh
user = "lukaszpe"
usergroup = "uinput libvirt uucp wheel"
#Strefa czasowa
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
useradd -m -G $usergroup -s /bin/zsh $user
echo "123\n123" | passwd $user
echo "123" su - $user -c "mkdir -p /home/lukaszpe/.config" 
./restoreSystemSettingsBackup.sh
./restoreUserBackUp.sh
locale-gen
mkinitcpio -P
echo "rutpwd\nrutpwd" | passwd 
grub-install /dev/sda
grub2-mkconfig -o /boot/grub2/grub.cfg
pacman -Syyu  - --noconfirm --needed < pacman-light
echo "123" | su - $user -c "echo \"123\nT\" | yay -Syyu - --noconfirm < yay" 