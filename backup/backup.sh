#!/bin/bash
rsync -avh --delete --progress \
  \
  --exclude='miniforge3' \
  --exclude='tmp' \
  --exclude='.cache' \
  --exclude='.local/share/Steam' \
  --exclude='.npm' \
  --exclude='.m2' \
  --exclude='.cpan' \
  --exclude='.cpanm' \
  --exclude='.wine' \
  --exclude='.sdkman' \
  /home/fred/ /media/backup/fred-backup/ # --exclude='Games' \
echo "Backup complete!"
