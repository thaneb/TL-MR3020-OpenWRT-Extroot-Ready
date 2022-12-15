# OpenWRT 19.07 extroot ready build for the TP-Link MR3020 v1.x

http://www.73connection.com/openwrt/targets/ar71xx/tiny/

Here you will find a extroot ready build of Openwrt 19.07 for the TL-MR3020 v1.x
Easy to flash, Luci and ipv6 not included in order to fit the stock embedded nand memory size.
Some updates and new packages will be released when available.
Release available 19.0.7 r11431-83b0e20711

#Default lan IP: 192.168.1.1
#Default wifi SSID: OW-MR3020
#Default wifi key: sup3rMR3020


# Wifi connect helper: /extrooter/0-wifi-client-connect.sh
Help to connect your wifi network, display available networks, input the target network name (without any "" or ''), then input the key, and you're connected!

-> cd /extrooter
-> ./0-wifi-client-connect.sh

# Extroot script: /extrooter/1-extroot.sh
Script that will:
- ask you if you wish to save RAM by removing opkg temp files from it
- display available usb partition(s)
- ask you which partition to use as system overlay and if formatting is required
- ask you if and which partition to use as system SWAP
- reboot

-> cd /extrooter
-> ./1-extroot.sh

Extra-step for Luci, after reboot,
opkg update
opkg install luci-ssl

Feel free to contact me ;)
