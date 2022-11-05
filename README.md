# OpenWRT 19.07 extroot ready build for the TP-Link MR3020 v1.x

Here you will find a extroot ready build of Openwrt 19.07 for the TL-MR3020 v1.x
Easy to flash, Luci not included in order to fit the stock embedded nand memory size.
After flash, you will find a /etc/extroot-sda1.sh that will format the /dev/sda1 as a ext4 filesystem, create and copy the overlay, then update fstab and finally reboot.
You will be exrooted !! 

If your usb devices has a sda2 (second partition in the map) formatted as Linux swap (can be done through gparted on any linux os), the system will of course use it as a swap.

You can also find /etc/1-newbiescripts/3-wifi-client-connect.sh which can help you to connect to your local wifi network in order to install Luci and other packages you may want or need (you still need to edit it with your network bssid , ssid and key ; I will try to update this script for something more friendly as soon as I find the good bash script receipt).

* The opkg source.list is targeting the same website so all packages present there are fully compatible with this build (all build at same time).
* no ip v6
* usb mass storage
* /etc/extroot-sda1.sh to format and extroot rootfs to sda1
* /etc/1-newbiescripts/2-opkg-ramsaver.sh to use your new disk space instead of ram to store packages list
* /etc/1-newbiescripts/3-wifi-client-connect.sh that you can edit with vi to easily connect your MR3020 to your wireless network
* swap use activated in kernel

Some updates will be released when I have time and/or when something new will be available in source.
Release available 19.0.7 r11431-83b0e20711
http://www.73connection.com/openwrt/targets/ar71xx/tiny/

Others files
http://www.73connection.com/openwrt/targets/

Feel free to contact me ;)
