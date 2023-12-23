#!/bin/sh
#cp ./systemSettings/etc/{group,locale.gen,locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,modprobe.d/vfio.conf,sudoers} /etc
cp ./systemSettings/etc/{locale.gen,locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,sudoers} /etc
#cp -R ./systemSettings/etc/{chmod*,getty*} /etc/systemd/system/
#cp ./systemSettings/etc/00-keyboard.conf X11/ /etc/X11/xorg.conf.d/
cp ./systemSettings/usrBin/{get,pod} /usr/bin/

mkdir -p /run/media/lukaszpe/{BackUp,Skany,ŁEPskiSerwer,Minix}

echo "#6TB BackUp  HDD" >> /etc/fstab
echo "UUID=42c7a5f9-95d0-4623-8002-7be087466de4 /run/media/lukaszpe/BackUp exfat noauto,defaults,users,x-gvfs-show 0 0" >> /etc/fstab
echo "#NFS Shares" >> /etc/fstab
echo "192.168.178.11:/mnt/udata/skany /run/media/lukaszpe/Skany nfs defaults,users,x-systemd.mount-timeout=5 0 0" >> /etc/fstab
echo "192.168.178.12:/mnt/dane/dane /run/media/lukaszpe/ŁEPskiSerwer nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab
echo "192.168.178.13:/mnt/dane /run/media/lukaszpe/Minix nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab
