#!/bin/sh

pacman -Syyu --noconfirm --needed $(<pacman-light)
cd /home
git clone https://aur.archlinux.org/yay.git
cd /yay
makepkg -si