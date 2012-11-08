#!/bin/sh

START=$(date +%s)
rsync -aAXv /* $1 --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found/*,/home/*/.gvfs,/home/*/.thumbnails/*,/home/*/.cache/chromium/*,/home/*/.mozilla/firefox/*.default/Cache/*,/home/*/.cpan/*,/home/*/abs/*,/var/lib/pacman/sync/*,/var/abs/*,/var/cache/*,/var/log/*,/var/tmp/*}
FINISH=$(date +%s)
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds"

touch $1/"Backup from $(date '+%A, %d %B %Y, %T')"