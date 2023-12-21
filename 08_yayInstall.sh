#!/bin/sh

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
yay -Syyu - --noconfirm < yay