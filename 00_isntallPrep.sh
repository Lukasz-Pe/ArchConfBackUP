#!/bin/sh

loadkeys pl
setfont Lat2-Terminus16.psfu.gz -m 8859-2
timedatectl set-ntp true

echo "Przygotuj bpartycje przy pomocy parted lub fdisk.\n"
echo "I wywołaj skrypt 01_pacstrap.sh."
echo "Zmień lokację instalacji GRUBa w pliku 02_installArch.sh!"