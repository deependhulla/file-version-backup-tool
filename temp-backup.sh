rsync -av  "/home/mailadmin/Documents" "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-32-13/" --link-dest="/home/mailadmin/timebackup/dvddocs_latest_link"
rm "/home/mailadmin/timebackup/dvddocs_latest_link" ;  ln -vs "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-32-13/" "/home/mailadmin/timebackup/dvddocs_latest_link"
find "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-32-13/" -type f -links 1 -exec du -sh  {} \; > "/home/mailadmin/timebackup/dvddocs_2020-01-23_18-32-13_report.txt"
echo "Read file for  /home/mailadmin/timebackup/dvddocs_2020-01-23_18-32-13_report.txt "  
