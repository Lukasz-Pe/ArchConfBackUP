#!/bin/sh
#User setting backup
HomeDir="/home/lukaszpe"
mkdir -p userConf/cfg
cp -R  $HomeDir/.config/{alacritty,gtk-*,mimewyapps.list,pavucontrol.ini,PrusaSlicer,sway,waybar,yay} ./userConf/cfg
cp -R  $HomeDir/{.p10k.zsh,.zprofile,.zshrc} ./userConf
#System settings backup
mkdir -p systemSettings/{etc,usrBin}
sudo cp -R /etc/{locale.conf,vconsole.conf,hostname,hosts,mkinitcpio.conf,modprobe.d/vfio.conf,sudoers,systemd/system/{chmod*,getty@*},X11/xorg.conf.d/00-keyboard.conf} ./systemSettings/etc
sudo cp -R /usr/bin/{get,pod,rofication-gui-lukaszpe.py} ./systemSettings/usrBin
#Packlist
pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > ./pacman
pacman -Qqm > ./yay
