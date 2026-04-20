DEVICE="wlan0"

SSID="DeltaKart105"
PASS="deltakart105"

nmcli dev wifi hotspot ifname $DEVICE ssid $SSID password $PASS
