#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

CRONJOBS="1 4 * * * $HOME/scripts/maintain.sh > $HOME/scripts/maintain.log"
(sudo crontab -l ; echo "$CRONJOBS") | sudo crontab
