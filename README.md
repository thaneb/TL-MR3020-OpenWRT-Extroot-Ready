# OpenWRT 19.07 extroot ready build for the TP-Link MR3020 v1.x
Here you will find a extroot ready build of Openwrt 19.07 for the TL-MR3020 v1.x
Easy to flash, Luci and ipv6 not included in order to fit the stock embedded nand memory size.

Default wifi SSID: OW-MR3020
Default wifi key: sup3rMR3020


# 1 Extroot script /etc/1-extroot.sh
/etc/1-extroot.sh will help you format your usb device /dev/sdaX as a ext4 filesystem, create and copy the overlay, then update fstab and finally reboot.
If your usb devices has a sdaX+1 (second partition in the map) formatted as Linux swap (can be done through gparted on any linux os), you can activated it as swap through the command: swapon /dev/sdaX 

-> ./etc/1-extroot.sh

#2 Save some ram with clearing opkg caches files /etc/2-opkg-ramsaver.sh

-> ./etc/2-opkg-ramsaver.sh

#3 Wifi connect helper /etc/3-wifi-client-connect.sh
You can also find /etc/3-wifi-client-connect.sh which can help you to connect to your local wifi network in order to install Luci and other packages you may want or need (you still need to edit it with your network ssid and key).

-> vi /etc/3-wifi-client-connect.sh
-> ./etc/3-wifi-client-connect.sh

* The opkg source.list is targeting the same website so all packages present there are fully compatible with this build (all build at same time).
* no ip v6
* usb mass storage
* swap use activated in kernel

Some updates will be released when I have time and/or when something new will be available in source.
Release available 19.0.7 r11431-83b0e20711

http://www.73connection.com/openwrt/targets/ar71xx/tiny/

Feel free to contact me ;)
