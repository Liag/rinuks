#!/bin/bash

set -x

MONTH=$(env LC_ALL=C date +%B)

if ssh v@yr test -e "/run/media/v/Saya/backup/pleroma/monthly/install/$MONTH" ; then
  ssh v@yr "rm -rf /run/media/v/Saya/backup/pleroma/monthly/install/$MONTH"
fi

if ssh v@yr test -e "/run/media/v/Saya/backup/pleroma/monthly/db/$MONTH.sql" ; then
  ssh v@yr "rm /run/media/v/Saya/backup/pleroma/monthly/db/$MONTH.sql"
fi

if ssh v@yr test -e "/run/media/v/Saya/backup/pleroma/monthly/nginx/$MONTH" ; then
  ssh v@yr "rm /run/media/v/Saya/backup/pleroma/monthly/nginx/$MONTH"
fi

rsync -a --delete --quiet --inplace /home/pleroma/pleroma/ v@yr:/run/media/v/Saya/backup/pleroma/monthly/install/$MONTH/

runuser -l postgres -c "pg_dump pleroma_dev > /home/postgres/backup/$MONTH.sql"

rsync -a --delete --quiet --inplace /home/postgres/backup/$MONTH.sql v@yr:/run/media/v/Saya/backup/pleroma/monthly/db/

rm /home/postgres/backup/$MONTH.sql

rsync -a --delete --quiet --inplace /etc/nginx/ v@yr:/run/media/v/Saya/backup/pleroma/monthly/nginx/$MONTH/

