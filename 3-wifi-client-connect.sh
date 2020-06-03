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
uci set wireless.@wifi-iface[-1].bssid=0c:80:63:86:60:f3
uci set wireless.@wifi-iface[-1].device=radio0
uci set wireless.@wifi-iface[-1].ssid=STRONGFI
uci set wireless.@wifi-iface[-1].encryption=psk2
uci set wireless.@wifi-iface[-1].key=passwd
uci set wireless.@wifi-iface[-1].mode=sta
uci set wireless.@wifi-iface[-1].network=wlan
uci commit
/etc/init.d/network restart

