#!/bin/sh
clear
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "* * * *  Welcome to OpenWRT ExtRoot Automator * * * *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "* ! ! ! WARNING ! incorrect use MAY ERASE DATA! ! ! *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo ""

## RAM saving on opkg temp files request

read -p "Should we save RAM from opkg temp files? (yes or no) :" RAM_SAVER

if [ "$RAM_SAVER" = "yes" ]; then
	sed -i -r -e "s/^(lists_dir\sext\s).*/\1\/usr\/lib\/opkg\/lists/" /etc/opkg.conf
	echo "RAM saving on opkg temp files activated"
	else echo "opkg temp files kept as default"
fi

## Gathering details and requestting orders

echo "Available target devices in your system are:"
block info | grep -o -e "/dev/sd\S*"
read -p "Which drive do we set up as extroot? (ex: /dev/sda1) :" OVERLAY_DRIVE_TARGET
read -p "Do we need to format it ? (yes or no) " OVERLAY_MODE_TARGET
read -p "Is there a swap partition we should activate? (yes or no) :" SWAP_MODE_TARGET
echo ""

## Formatting and set up system SWAP if requested
if [ "$SWAP_MODE_TARGET" = "yes" ]; then
	read -p "Which partition should be used as SWAP? (ex: /dev/sda2) :" SWAP_DRIVE_TARGET
	echo "" 
	echo "Formatting $SWAP_DRIVE_TARGET as a swap partition"
	mkswap $SWAP_DRIVE_TARGET
	echo ""
	echo "Activating $SWAP_DRIVE_TARGET as a swap partition"
	swapon $SWAP_DRIVE_TARGET
	uci set fstab.swap="swap"
	uci set fstab.swap.device="$SWAP_DRIVE_TARGET"
	uci set fstab.swap.enabled="1"
	uci commit fstab
	echo ""
	else echo "No partition defined as SWAP"
	echo ""
fi

## Formatting overlay partition if requested
if [ "$OVERLAY_MODE_TARGET" = "yes" ]; then
	echo "Formatting $OVERLAY_DRIVE_TARGET as an ext4 file system"
	mkfs.ext4 $OVERLAY_DRIVE_TARGET
	echo ""
	else echo "$DRIVE_TARGET not formatted"
fi

## Setting up overlay in fstab

eval $(block info "${OVERLAY_DRIVE_TARGET}" | grep -o -e "UUID=\S*")
uci -q delete fstab.overlay
uci set fstab.overlay="mount"
uci set fstab.overlay.uuid="${UUID}"
uci set fstab.overlay.target="/overlay"
uci commit fstab
mount $OVERLAY_DRIVE_TARGET /mnt
cp -a -f /overlay/. /mnt
umount /mnt
echo " "
read -p "*****Drive $OERLAY_DRIVE_TARGET ready, press any key to reboot******"
reboot
