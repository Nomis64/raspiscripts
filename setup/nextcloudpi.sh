#!/bin/bash
# auf Raspi ausführen
THISDIR="$(dirname "$(readlink -f "$0")")"
cd $THISDIR
mkdir -p ~/backupforscript

# https://nextcloudpi.com/

# WARNING: This installer will disable SSH login for the root user and reset its password.
# If you need to login with root, you should make sure, you have a root session open that you can use,
# to revert these changes afterwards (set PermitRootLogin to 'yes' in /etc/ssh/sshd_config and run passwd as root).
# Continuing in 27s (press Ctrl+C to abort)...


curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | sudo bash


# First: Visit https://192.168.178.28/  https://nextcloudpi.local/ (also https://nextcloudpi.lan/ or https://nextcloudpi/ on windows and mac)
# to activate your instance of NC, and save the auto generated passwords. You may review or reset them
# anytime by using nc-admin and nc-passwd.
# Second: Type 'sudo ncp-config' to further configure NCP, or access ncp-web on https://192.168.178.28:4443/
# Note: You will have to add an exception, to bypass your browser warning when you
# first load the activation and :4443 pages. You can run letsencrypt to get rid of
# the warning if you have a (sub)domain available.
