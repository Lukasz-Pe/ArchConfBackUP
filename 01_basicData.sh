#Set username
user=lukaszpe
#set hostname (name of PC in network)
hostName=vmEGM
#disk to be partitioned
disk='/dev/sda'
#region and city for timezone as per 
# https://wiki.archlinux.org/title/installation_guide#Time
# https://wiki.archlinux.org/title/System_time#Time_zone
region='Europe'
city='Berlin'
#size of EFi bartition for UEFI system
EFIsize='250M'
#size of Swap partition
swapSize='12G'
#size of main(/) partition, home takes all that is left
sysSize='30G'
#locale sttings
locale='pl_PL.UTF-8'
#vconsole settings
keymap='pl2'
font='Lat2-Terminus16'
font_map='8859-2'
#Dir names in user's home
documents='Dokumenty'
pictures='Obrazy'
music='Muzyka'
video='Wideo'
download='Pobrane'
programming='Programowanie'