# OpenWRT 19.07 extroot ready build for the TP-Link MR3020 v1.x
Here you will find a extroot ready build of Openwrt 19.07 for the TL-MR3020 v1.x
Easy to flash, Luci and ipv6 not included in order to fit the stock embedded nand memory size.

Default wifi SSID: OW-MR3020
Default wifi key: sup3rMR3020


# Wifi connect helper /etc/0-wifi-client-connect.sh
Help to connect your wifi network, display available networks, input the target network name (without any "" or ''), then input the key, and you're connected!

-> cd /etc
-> ./0-wifi-client-connect.sh

# Extroot script /etc/1-extroot.sh
/etc/1-extroot.sh will:
- ask you if you wish to save RAM by removing opkg temp files from it
- display available usb partition
- ask you which partition to use as system overlay and if formating is required
- ask you if and which partition to use as system SWAP
- reboot

-> cd /etc
-> ./1-extroot.sh

* The opkg source.list is targeting the same website so all packages present there are fully compatible with this build (all build at same time).
* no ip v6
* usb mass storage

Some updates will be released when I have time and/or when something new will be available in source.
Release available 19.0.7 r11431-83b0e20711

http://www.73connection.com/openwrt/targets/ar71xx/tiny/

Feel free to contact me ;)
