#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

cat ./authorized_keys >> ~/.ssh/authorized_keys

CRONJOBS="@reboot sleep 60; ~/scripts/dotheserveo.sh
*/15 * * * * ~/scripts/dotheserveo.sh"
(crontab -l ; echo "$CRONJOBS") | crontab

