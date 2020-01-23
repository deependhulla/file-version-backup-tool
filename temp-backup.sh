rsync -av  "/home/mailadmin/Documents" "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-24-01/" --link-dest="/home/mailadmin/timebackup/dvddocs_latest_link"
rm "/home/mailadmin/timebackup/dvddocs_latest_link" ;  ln -vs "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-24-01/" "/home/mailadmin/timebackup/dvddocs_latest_link"

