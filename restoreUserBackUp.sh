#!/bin/sh

#User setting restore
HomeDir="/home/lukaszpe"

cp -R  ./userConf/cfg/{alacritty,mimeapps.list,pavucontrol.ini,PrusaSlicer,sway,waybar,yay} $HomeDir/.config/
cp -R  ./userConf/{.p10k.zsh,.sway,.zprofile,.zshrc} $HomeDir