#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript


# externe Festplatten
sudo mkdir -p /media/external2 /media/external3 /media/external4
STABEXTERNAL="/dev/disk/by-uuid/4e22da58-076c-4e17-8fc0-921e8ec79017 /media/external2 auto rw,nosuid,nodev,noexec,auto,nouser,async,nofail 0 0
/dev/disk/by-uuid/2abecba0-fff7-4ff1-889c-e7ec2f26a8da /media/external3 auto rw,nosuid,nodev,noexec,auto,nouser,async,nofail 0 0
/dev/disk/by-uuid/552da560-e676-4be9-b706-d6a2b3a7c407 /media/external4 auto rw,nosuid,nodev,noexec,auto,nouser,async,nofail 0 0"

cp /etc/fstab ~/backupforscript/fstab && \
cp /etc/fstab ~/backupforscript/fstab2 && \
echo "$STABEXTERNAL" >> ~/backupforscript/fstab2 && \
sudo cp ~/backupforscript/fstab2 /etc/fstab
rm ~/backupforscript/fstab2

sudo mount -a

# backwards compatibility:
# sudo rm -d /external4
# sudo ln -s /media/external4 /external4
