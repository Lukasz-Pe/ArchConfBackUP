#!/bin/sh
#import all variables
source ./00_basicData.sh
#User setting restore
HomeDir="/home/$user"
mkdir -p $HomeDir/.config/{alacritty,PrusaSlicer,sway,waybar,yay,gtk-{2.0,3.0,4.0}}
cp -R  ./userConf/cfg/{alacritty,mimeapps.list,pavucontrol.ini,PrusaSlicer,sway,waybar,yay,gtk-{2.0,3.0,4.0}} $HomeDir/.config/
cp -R  ./userConf/{.p10k.zsh,.sway,.zprofile,.zshrc} $HomeDir
mkdir $HomeDir/{$documents,$music,$pictures,$video,$download,$programming}
find $HomeDir -exec chown lukaszpe:lukaszpe {} +
find $HomeDir -type d -exec chmod 755 {} +
find $HomeDir -type f -exec chmod 644 {} +
find $HomeDir -exec sed -i "/s/lukaszpe/$user/g" {} +
#YAY install
cd ~
git clone https://aur.archlinux.org/yay.git
cd ~/yay
makepkg -si
#Install aur packages
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
yay -Syyu --noconfirm $(<yay)