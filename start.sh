#!/bin/bash
if [ "$VPN_SUBNET" != "" ] ; then
  iptables -t nat -A POSTROUTING -s $VPN_SUBNET -j MASQUERADE
fi
sysctl -w net.ipv4.ip_forward=1

rm -f /var/run*.pid

ipsec start --nofork

