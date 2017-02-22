#!/bin/bash

echo "# check and apply for overwrites (ovw) :"
if [ ! -e  /service/ovw ] ; then
  mkdir -p /service/ovw
fi
if [ ! -e  /service/mig ] ; then
  mkdir -p /service/mig
fi
rsync -av /service/ovw/ /


if [ "$VPN_SUBNET" != "" ] ; then
  iptables -t nat -A POSTROUTING -s $VPN_SUBNET -j MASQUERADE
fi
sysctl -w net.ipv4.ip_forward=1

rm -f /var/run*.pid

ipsec start --nofork

