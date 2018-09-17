#!/bin/bash

DAY=$(env LC_ALL=C date +%A)

if ssh v@yr test -e "/run/media/v/Saya/backup/pleroma/daily/install/incr/$DAY" ; then
  ssh v@yr "rm -rf /run/media/v/Saya/backup/pleroma/daily/install/incr/$DAY"
fi

if ssh v@yr test -e /run/media/v/Saya/backup/pleroma/daily/db/$DAY.sql ; then
  ssh v@yr "rm /run/media/v/Saya/backup/pleroma/daily/db/$DAY.sql"
fi

rsync -a --delete --quiet --inplace --backup --backup-dir=../incr/$DAY/ /home/pleroma/pleroma/ v@yr:/run/media/v/Saya/backup/pleroma/daily/install/full/

runuser -l postgres -c "pg_dump pleroma_dev > /home/postgres/backup/$DAY.sql"

rsync -a --delete --quiet --inplace /home/postgres/backup/$DAY.sql v@yr:/run/media/v/Saya/backup/pleroma/daily/db/

rm /home/postgres/backup/$DAY.sql
