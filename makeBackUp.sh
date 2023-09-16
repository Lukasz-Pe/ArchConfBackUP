#!/bin/sh
#User setting backup
HomeDir="/home/lukaszpe"
mkdir -p userConf/cfg
cp -R  $HomeDir/.config/{alacritty,gtk-*,mimeapps.list,pavucontrol.ini,PrusaSlicer,sway,waybar,yay} ./userConf/cfg
cp -R  $HomeDir/{.p10k.zsh,.sway,.zprofile,.zshrc} ./userConf
#System settings backup
mkdir -p systemSettings/{etc,usrBin}
sudo cp -R /etc/{locale.gen,locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,modprobe.d/vfio.conf,sudoers,systemd/system/{chmod*,getty*},X11/xorg.conf.d/00-keyboard.conf} ./systemSettings/etc
sudo cp -R /usr/bin/{get,pod} ./systemSettings/usrBin
#Packlist
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > ./pacman
pacman -Qqm > ./yay
