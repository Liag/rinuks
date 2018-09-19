#!/bin/bash

MONTH=$(env LC_ALL=C date +%B)

if test -e "/run/media/v/Saya/backup/pleroma/monthly/install/$MONTH" ; then
  rm -rf /run/media/v/Saya/backup/pleroma/monthly/install/$MONTH
fi

if test -e "/run/media/v/Saya/backup/pleroma/monthly/db/$MONTH.sql" ; then
  rm /run/media/v/Saya/backup/pleroma/monthly/db/$MONTH.sql
fi

rsync -a --delete --quiet --inplace pleroma@isa:/home/pleroma/pleroma/ /run/media/v/Saya/backup/pleroma/monthly/install/$MONTH/

ssh postgres@isa "pg_dump pleroma_dev > /home/postgres/backup/$MONTH.sql"

rsync -a --delete --quiet --inplace postgres@isa:/home/postgres/backup/$MONTH.sql /run/media/v/Saya/backup/pleroma/monthly/db/

ssh postgres@isa "rm /home/postgres/backup/$MONTH.sql"

