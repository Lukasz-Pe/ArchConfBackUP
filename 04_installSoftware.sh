#!/bin/sh
#import all variables
source ./00_basicData.sh
pacman -Syyu --noconfirm --needed $(<pacman)
su -c "./05_restoreUserBackUp.sh" $user
systemctl enable --now cronie.service