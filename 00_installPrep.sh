#!/bin/sh
mount /dev/sda2 /mnt
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@tmp
btrfs sub cr /mnt/@log
btrfs sub cr /mnt/@pkg
btrfs sub cr /mnt/@snapshots
umount /mnt
