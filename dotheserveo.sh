#!/bin/bash

# sleep 60
# /usr/local/bin/autossh -M 0 -o ExitOnForwardFailure=yes -o ServerAliveInterval=30 -R traspirrr1:22:localhost:22 serveo.net # | tee ~/scripts/dotheserveolog.txt

ssh -o ExitOnForwardFailure=yes  -o ServerAliveInterval=15 -R traspirrr1:22:localhost:22 serveo.net
