#!/bin/sh
#import all variables
source ./01_basicData.sh
pacman -Syyu --noconfirm --needed $(<pacman)