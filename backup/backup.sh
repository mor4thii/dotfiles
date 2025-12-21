#!/bin/bash
rsync -avh --delete --progress /home/fred/ /media/backup/fred-backup/
echo "Backup complete!"
