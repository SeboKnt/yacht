#!/bin/sh

# script to create the apkovl from / on a alpine server
# home, root and etc(?) are persistent

rm -r /root/.ash_history
lbu include /home
lbu include /root
lbu package mint.apkovl.tar.gz