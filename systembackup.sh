#!/bin/bash

DAY=$(env LC_ALL=C date +%A)

if test -e "/run/media/v/Saya/backup/system/incr/$DAY" ; then
  rm -rf /run/media/v/Saya/backup/system/incr/$DAY
fi

rsync -aAX --delete --inplace --backup --backup-dir=../incr/$DAY --exclude-from="/home/v/bin/sysbackupexclude.txt" / /run/media/v/Saya/backup/system/full/
