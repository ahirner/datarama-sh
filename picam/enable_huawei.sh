#Change from mass storage to cdc ethernet mode (current raspbian might have issue to persist that with udev)
sudo usb_modeswitch -v 12d1 -p 1f01 -J
echo "Route incoming traffic to cdc eth1 (192.168.8.1)"
sudo iptables -t nat -A PREROUTING -p tcp -d 0/0 --dport 8080 -j DNAT --to 192.168.8.1:80
sudo iptables -t nat -A POSTROUTING -j MASQUERADE

