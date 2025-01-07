#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

CRONJOBS="1 4 * * * ~/scripts/maintain.sh"
(crontab -l ; echo "$CRONJOBS") | crontab
