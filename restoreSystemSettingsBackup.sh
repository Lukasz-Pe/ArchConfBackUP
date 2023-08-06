#!/bin/sh
cp ./systemSettings/{locale.gen,locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,modprobe.d/vfio.conf,sudoers}
cp -R ./systemSettings/{chmod*,getty*} /etc/systemd/system/
cp ./systemSettings/00-keyboard.conf X11/ /etc/X11/xorg.conf.d/

echo "192.168.178.11:/mnt/udata/skany /run/media/lukaszpe/Skany nfs defaults,users,x-systemd.mount-timeout=5 0 0" >> /etc/fstab
echo "192.168.178.12:/mnt/dane/dane /run/media/lukaszpe/ŁEPskiSerwer nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab
echo "192.168.178.13:/mnt/dane /run/media/lukaszpe/Minix nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab