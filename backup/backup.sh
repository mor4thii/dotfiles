#!/bin/bash
rsync -avh --delete --progress \
  --exclude='Games/battlenet' \
  --exclude='miniforge3' \
  --exclude='tmp' \
  --exclude='.ansible' \
  --exclude='.cache' \
  --exclude='.local' \
  --exclude='.config' \
  --exclude='.cpan' \
  --exclude='.cpanm' \
  --exclude='.m2' \
  --exclude='.mozilla' \
  --exclude='.npm' \
  --exclude='.sdkman' \
  --exclude='.thumbnails' \
  --exclude='.var' \
  --exclude='.wine' \
  /home/fred/ /media/backup/fred-backup/
echo "Backup complete!"

if [ $? -eq 0 ]; then
  notify-send "Backup Complete" "Home directory backed up successfully"
else
  notify-send -u critical "Backup Failed" "Check logs: journalctl --user -u backup.service"
fi
