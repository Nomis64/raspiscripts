#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

# https://nextcloudpi.com/

curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | bash
