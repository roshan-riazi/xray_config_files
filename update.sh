#!/bin/sh

echo "$(date +%Y%m%d_%H:%M:%S) - called update script." >> /opt/etc/xray/update.log

# add update_xray_git & update_iran_domains cron jobs
cru a update_iran_domains "55 6 * * * /opt/etc/xray/update_iran_domains.sh"
cru a update_xray_git "00 * * * * /opt/etc/xray/update_xray_git.sh"

# edit /jffs/scripts/wan-event file by replacing update_iran_domains with update_xray_git (only for update_xray_git.sh)
sed -i '/update_xray_git.sh/c\cru a update_xray_git "00 * * * * /opt/etc/xray/update_xray_git.sh" # Added by xray-mngr' /jffs/scripts/wan-event

# edit update_xray_git.sh file by replacing 'meme' with '$my_name'
sed -i 's/meme/\$my_name/g' /opt/etc/xray/update_xray_git.sh

# update xray file in /opt/sbin and make it executable
cp xray /opt/sbin/xray
chmod +x xray /opt/sbin/xray