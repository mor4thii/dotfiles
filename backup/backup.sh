#!/bin/bash
rsync -avh --delete --progress \
  --exclude='Games/battlenet' \
  --exclude='miniforge3' \
  --exclude='tmp' \
  --exclude='.cache' \
  --exclude='.local/share/Steam' \
  --exclude='.local/share/Trash' \
  --exclude='.cpan' \
  --exclude='.cpanm' \
  --exclude='.m2' \
  --exclude='.npm' \
  --exclude='.sdkman' \
  --exclude='.thumbnails' \
  --exclude='.wine' \
  /home/fred/ /media/backup/fred-backup/
echo "Backup complete!"
