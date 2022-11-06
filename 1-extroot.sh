#!/bin/bash
clear
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "* * * *  Welcome to OpenWRT ExtRoot Automator * * * *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "* ! ! ! WARNING ! incorrect use MAY ERASE DATA! ! ! *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo ""

## requesting user input

echo "Available target devices in your system are :"
block info | grep -o -e "/dev/sd\S*"
read -p "Which drive do we set up as extroot ? (ex: /dev/sda1) " DRIVE_TARGET
read -p "Do we need to format it ? (answer by yes or no) " MODE_TARGET

## Test the formating request and format if needed

if [ "$MODE_TARGET" = "yes" ]; then
	echo "Formating $DRIVE_TARGET as ext4 file system"
	mkfs.ext4 $DRIVE_TARGET
	else echo "$DRIVE_TARGET not formatted"
fi

## Read drive's UUID from block info and get it ready to use as overlay in fstab

eval $(block info "${DRIVE_TARGET}" | grep -o -e "UUID=\S*")
uci -q delete fstab.overlay
uci set fstab.overlay="mount"
uci set fstab.overlay.uuid="${UUID}"
echo ${UUID}
uci set fstab.overlay.target="/overlay"
uci commit fstab
mount $DRIVE_TARGET /mnt
cp -a -f /overlay/. /mnt
umount /mnt
echo "###############################################"
echo "*******Drive $DRIVE_TARGET ready, rebooting********"
echo "###############################################"
reboot
