#!/bin/bash
# on ubuntu
local_mirror="/var/www/html/alpine"

repo='
  edge/main/x86_64/
  edge/community/x86_64/
  v3.17/community/x86_64/
  v3.17/main/x86_64/
  v3.17/releases/x86_64/
'

lockfile="/tmp/alpine-mirror.lock"

exec 200>"$lockfile"
flock -n 200 || exit 1

  date >> /root/mirror.txt 
  
  for r in $repo ; do
    if [ ! -d "$local_mirror/$r" ]; then
        mkdir -p "$local_mirror/$r"
    fi
    rsync -avhP --delete-excluded rsync://rsync.alpinelinux.org/alpine/$r $local_mirror/$r
  done
  
  date >> /root/mirror.txt
  echo "################" >> /root/mirror.txt

exec 200>&-
