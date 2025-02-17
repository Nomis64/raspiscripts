#!/bin/bash

echo $(date)

BACKUPDISK=/media/external2
if mountpoint -q "$BACKUPDISK"; then
BACKUPPATH="$BACKUPDISK/backup/raspi/"
sudo mkdir -p $BACKUPPATH && \
echo creating backup...
sudo rsync -av --delete \
    --exclude=/dev \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/media \
    --exclude=/var \
    --exclude=/lost+found \
    --exclude=/swapfile \
/ "$BACKUPPATH"

BACKUPPATH="$BACKUPDISK/backup/raspimedia/"
sudo mkdir -p $BACKUPPATH && \
echo creating another backup...
sudo rsync -av --delete \
    --exclude=/external2/backup \
/media/ "$BACKUPPATH"

else
echo NOT CREATING BACKUP
fi

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo shutdown --reboot 2


