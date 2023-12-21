#!/bin/sh

#User setting restore
HomeDir="/home/lukaszpe"
mkdir -p $HomeDir/.config/{alacritty,PrusaSlicer,sway,waybar,yay}
cp -R  ./userConf/cfg/{alacritty,mimeapps.list,pavucontrol.ini,PrusaSlicer,sway,waybar,yay} $HomeDir/.config/
cp -R  ./userConf/{.p10k.zsh,.sway,.zprofile,.zshrc} $HomeDir
