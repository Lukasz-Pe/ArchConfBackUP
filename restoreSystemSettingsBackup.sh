#!/bin/sh
#import all variables
source ./00_basicData.sh

#cp ./systemSettings/etc/{group,locale.gen,locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,modprobe.d/vfio.conf,sudoers} /etc

cp ./systemSettings/etc/{mkinitcpio.conf,sudoers} /etc
cp -R ./systemSettings/etc/{chmod*,getty*} /etc/systemd/system/
#cp ./systemSettings/etc/00-keyboard.conf X11/ /etc/X11/xorg.conf.d/
cp ./systemSettings/usrBin/{get,pod,rofication-gui-lukaszpe.py} /usr/bin/
touch /etc/{locale.conf,hostname,hosts,vconsole.conf}
#locale
echo "LANG="$locale >> /etc/locale.conf
sed -i "/$locale/s/^#//" /etc/locale.gen
#vconsole
echo "KEYMAP=$keymap" >> /etc/vconsole.conf
echo "FONT=$font" >> /etc/vconsole.conf
echo "FONT_MAP=$font_map" >> /etc/vconsole.conf
#extract 
cp ./systemSettings/Night-Diamond-Red.tar.gz /usr/share/icons/
cd /usr/share/icons/
tar -xvf Night-Diamond-Red.tar.gz
rm Night-Diamond-Red.tar.gz
#host file
echo $hostName >> /etc/hostname
#hosts  file
echo "# Static table lookup for hostnames." >> /etc/hosts
echo "# See hosts(5) for details." >> /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 $hostName.localdomain" >> /etc/hosts
echo "in $hostName" >> /etc/hosts

mkdir -p /run/media/lukaszpe/{BackUp,Skany,ŁEPskiSerwer,Minix}

echo "#6TB BackUp  HDD" >> /etc/fstab
echo "UUID=42c7a5f9-95d0-4623-8002-7be087466de4 /run/media/lukaszpe/BackUp exfat noauto,defaults,users,x-gvfs-show 0 0" >> /etc/fstab
echo "#NFS Shares" >> /etc/fstab
echo "192.168.178.11:/mnt/udata/skany /run/media/lukaszpe/Skany nfs defaults,users,x-systemd.mount-timeout=5 0 0" >> /etc/fstab
echo "192.168.178.12:/mnt/dane/dane /run/media/lukaszpe/ŁEPskiSerwer nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab
echo "192.168.178.13:/mnt/dane /run/media/lukaszpe/Minix nfs defaults,users,x-systemd.mount-timeout=1 0 0" >> /etc/fstab
