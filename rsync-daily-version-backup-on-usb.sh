#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR

if [ -f '/tmp/read-fvb-backup-working.pid' ];
then
   echo "File /tmp/read-fvb-backup-working.pid exists"
else

touch /tmp/read-fvb-backup-working.pid


##Syntax for backup : 
##php fvb-take-backup.php <SOURCE_FOLDER> <DEST_FOLDER> <BACKUP_TITLE> 
##Example : 
##php fvb-take-backup.php "/home/mailadmin/Documents" "/home/mailadmin/timebackup" "dvddocs" > temp-backup.sh

php fvb-take-backup.php "/home" "/mnt/usbbackup/fileserver/version-backup" "fileserver-home-backup" > temp-backup.sh
php fvb-take-backup.php "/mnt/onedrivebackup/onedrivedev-data" "/mnt/onedrivebackup/onedrivedev-version-backup" "onedrivedev-backup" > temp-backup.sh
sh temp-backup.sh

echo done.
/bin/rm -rf /tmp/read-fvb-backup-working.pid
fi

