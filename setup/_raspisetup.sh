#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

# ./nextcloudpi.sh
./installprograms.sh
./ssh.sh
./externaldrives.sh
./cron.sh



