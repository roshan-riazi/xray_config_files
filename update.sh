#!/bin/sh

echo "$(date +%Y%m%d_%H:%M:%S) - called update script." >> /opt/etc/xray/update.log

# update xray file in /opt/sbin and make it executable
cp xray /opt/sbin/xray
chmod +x xray /opt/sbin/xray