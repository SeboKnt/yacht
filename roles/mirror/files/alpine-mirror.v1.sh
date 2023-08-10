#!/usr/bin/env sh

# /etc/periodic/hourly/alpine-mirror

# make sure we never run 2 rsync at the same time
lockfile="/tmp/alpine-mirror.lock"
if [ -z "$flock" ] ; then
  exec env flock=1 flock -n $lockfile "$0" "$@"
  fi
  date >> /root/start.txt 

  /usr/bin/rsync -vvv \
  --archive \
  --update \
  --hard-links \
  --delete \
  --delete-after \
  --delete-excluded \
  --delay-updates \
  --timeout=600 \
  --exclude v2.* \
  --exclude v3.0 \
  --exclude v3.1 \
  --exclude v3.2 \
  --exclude v3.3 \
  --exclude v3.4 \
  --exclude v3.5 \
  --exclude v3.6 \
  --exclude v3.7 \
  --exclude v3.8 \
  --exclude v3.9 \
  --exclude v3.10 \
  --exclude v3.11 \
  --exclude v3.12 \
  --exclude v3.13 \
  --exclude v3.14 \
  --exclude v3.15 \
  --exclude v3.16 \
  --exclude v3.17/community/aarch64/ \
  --exclude v3.17/community/armhf/   \
  --exclude v3.17/community/armv7/   \
  --exclude v3.17/community/ppc64le/ \
  --exclude v3.17/community/s390x/   \
  --exclude v3.17/community/x86/     \
  --exclude v3.17/main/aarch64/      \
  --exclude v3.17/main/armhf/        \
  --exclude v3.17/main/armv7/        \
  --exclude v3.17/main/ppc64le/      \
  --exclude v3.17/main/s390x/        \
  --exclude v3.17/main/x86/          \
  --exclude v3.17/releases           \
  --exclude v3.18                    \
   --exclude edge/testing            \
  "rsync://rsync.alpinelinux.org/alpine/" "/var/www/localhost/htdocs/alpine/"
  date >> /root/done.txt
