#!/bin/sh
echo "Available networks are:"
iwinfo wlan0 scan | grep ESSID | awk '{print $2}'
read -p "Input the name of WiFi network target (case sensitive): " WIFI_NAME
read -p "Input the key of WiFi network target (case sensitive): " WIFI_KEY
uci set wireless.radio0.disabled=0
uci commit wireless
wifi up
uci set network.wlan=interface
uci set network.wlan.proto=dhcp
uci commit
uci add_list firewall.@zone[1].network='wlan'
uci commit
uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].device=radio0
uci set wireless.@wifi-iface[-1].ssid=$WIFI_NAME
uci set wireless.@wifi-iface[-1].encryption=psk2
uci set wireless.@wifi-iface[-1].key=$WIFI_KEY
uci set wireless.@wifi-iface[-1].mode=sta
uci set wireless.@wifi-iface[-1].network=wlan
uci commit
read -p "Setup done, press any key to restart network"
/etc/init.d/network restart

