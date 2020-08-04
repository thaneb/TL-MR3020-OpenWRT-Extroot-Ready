#!/bin/bash
uci set wireless.radio0.disabled=0
uci commit wireless
wifi up
uci set network.wlan=interface
uci set network.wlan.proto=dhcp
uci commit
uci add_list firewall.@zone[1].network='wlan'
uci commit
uci add wireless wifi-iface
uci set wireless.@wifi-iface[-1].bssid=0x:x8:x3:x6:x0:fx #<--bssid_MAC_AD_OF_YOUR_AP/Router
uci set wireless.@wifi-iface[-1].device=radio0
uci set wireless.@wifi-iface[-1].ssid=NAME_OF_YOUR_NETWORK
uci set wireless.@wifi-iface[-1].encryption=psk2
uci set wireless.@wifi-iface[-1].key=Password_of_your_wifi_network
uci set wireless.@wifi-iface[-1].mode=sta
uci set wireless.@wifi-iface[-1].network=wlan
uci commit
/etc/init.d/network restart

