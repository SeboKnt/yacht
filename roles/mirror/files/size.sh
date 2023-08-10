#!/bin/sh

total=0
dest="$(mktemp -d)"

for dir in edge/main/x86_64/ edge/community/x86_64/ v3.17/community/x86_64/ v3.17/main/x86_64/ v3.17/releases/x86_64/ ; do
    old_total="$total"
    src="rsync://rsync.alpinelinux.org/alpine/$dir/"
    size=$(rsync -a -n --stats "$src" "$dest" | grep '^Total file size' | tr -d ',' | awk '{ print $4 }')
    total=$(( old_total + size ))
    echo "$dir: $size" | awk '{ print $1 sprintf("%.1f", $2/1073741824) }'
done

echo "total: $total" | awk '{ print $1 sprintf("%.1f", $2/1073741824) }'
rm -r "$dest"
