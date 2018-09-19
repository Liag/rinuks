#!/bin/bash

DAY=$(env LC_ALL=C date +%A)

if test -e "/run/media/v/Saya/backup/pleroma/daily/install/incr/$DAY" ; then
  rm -rf /run/media/v/Saya/backup/pleroma/daily/install/incr/$DAY
fi

if test -e /run/media/v/Saya/backup/pleroma/daily/db/$DAY.sql ; then
  rm /run/media/v/Saya/backup/pleroma/daily/db/$DAY.sql
fi

rsync -a --delete --quiet --inplace --backup --backup-dir=../incr/$DAY/ pleroma@isa:/home/pleroma/pleroma/ /run/media/v/Saya/backup/pleroma/daily/install/full/

ssh postgres@isa "pg_dump pleroma_dev > /home/postgres/backup/$DAY.sql"

rsync -a --delete --quiet --inplace postgres@isa:/home/postgres/backup/$DAY.sql /run/media/v/Saya/backup/pleroma/daily/db/

ssh postgres@isa "rm /home/postgres/backup/$DAY.sql"
