#!/bin/sh
user="lukaszpe"
usergroup="uinput,uucp,wheel"
groupadd uinput
groupadd uucp
#Strefa czasowa
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "USER: "$user
echo "uGROUPS: "$usergroup 
useradd -m -G $usergroup -s /bin/zsh $user
usermod -g $user $user
#useradd -m -G -s /bin/zsh $user
#usermod -a -G $usergroup $user
echo "123\n123" | passwd $user
echo "123" su - $user -c "mkdir -p /home/lukaszpe/.config" 
./restoreSystemSettingsBackup.sh
./restoreUserBackUp.sh
locale-gen
mkinitcpio -P
echo "123\n123" | passwd 
#grub-install /dev/sda
#grub-mkconfig -o /boot/grub/grub.cfg
pacman -Syyu  - --noconfirm --needed < pacman-light
#echo "123" | su - $user -c "echo \"123\nT\" | yay -Syyu - --noconfirm < yay" 
