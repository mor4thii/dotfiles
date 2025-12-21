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
