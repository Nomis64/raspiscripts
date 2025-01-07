#!/bin/bash

THISDIR="$(dirname "$(readlink -f "$0")")"
THELOG="$THISDIR/maintain.log"
date > "$THELOG"

BACKUPDISK=/media/external2
BACKUPPATH="$BACKUPDISK/backup/raspi/"
if mountpoint -q "$BACKUPDISK"; then
mkdir -p $BACKUPPATH && \
echo creating backup...  >> "$THELOG"
sudo rsync -av --update \
    --exclude=/dev \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/media \
    --exclude=/var \
    --exclude=/lost+found \
    --exclude=/swapfile \
/ "$BACKUPPATH" >> "$THELOG"
else
echo NOT CREATING BACKUP  >> "$THELOG"
fi

sudo apt update  >> "$THELOG"
sudo apt upgrade -y  >> "$THELOG"
sudo apt autoremove >> "$THELOG"
sudo shutdown --reboot 2


