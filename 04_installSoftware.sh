#!/bin/sh
#import all variables
source ./00_basicData.sh
pacman -Syyu --noconfirm --needed $(<pacman)
su $user ./05_restoreUserBackUp.sh