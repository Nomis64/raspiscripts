#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

sudo apt install git

cd ~
git clone https://github.com/Autossh/autossh.git
cd autossh
./configure
make
sudo make install
