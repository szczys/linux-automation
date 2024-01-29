#!/bin/sh

echo 'Starting backup now...' >> /tmp/borgBackup_create.log

#/usr/bin/borg create --verbose --filter AME --list --stats --show-rc --compression lz4 --exclude-caches --one-file-system --exclude-from ~/Scripts/borgBackup_exclude.txt /mnt/RootBackup/borg::'{hostname}-{now:%Y-%m-%d}' /
/usr/bin/borg create --list --exclude-from /home/mike/.borg_exclude /mnt/NAS_drive/krusty_backup/::{hostname}-root-{now:%Y-%m-%d} / >> /tmp/borgBackup_create.log 2>&1

/usr/bin/borg create --list --exclude-from /home/mike/.borg_exclude /mnt/NAS_drive/krusty_backup/::{hostname}-mike-{now:%Y-%m-%d} / >> /tmp/borgBackup_create.log 2>&1

echo -e 'Done.\n\n' >> /tmp/borgBackup_create.log

echo 'Starting prune now...' >> /tmp/borgBackup_prune.log
/usr/bin/borg prune -v --list --keep-weekly=6 --keep-monthly=4 /mnt/NAS_drive/krusty_backup/ >> /tmp/borgBackup_prune.log 2>&1
/usr/bin/borg compact /mnt/NAS_drive/krusty_backup/
echo -e 'Done.\n\n' >> /tmp/borgBackup_prune.log
