echo "Backup Started :" > /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt ; date >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
rclone copy -P --create-empty-src-dirs onedrivedev: /mnt/onedrivebackup/onedrivedev-data/ 1>/tmp/rclone1 2>/tmp/rclone2 ;cat /tmp/rclone1 > /tmp/rclone-log.txt ;cat /tmp/rclone2 >> /tmp/rclone-log.txt
rsync -av  "/mnt/onedrivebackup/onedrivedev-data" "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39/" --link-dest="/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_link"
rm "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_link" ;  ln -vs "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39/" "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_link"
echo "Backup Ended :" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt ; date >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
find "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39/" -type f -links 1 -exec du -sh  {} \; > "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39_report.txt"
echo "Backup Size: " >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt;
cat /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39_report.txt | sed 's/	//g' |cut -d "/" -f 1 | sort -n | paste -s -d+ - | bc | ./kb-to-mb-or-gb.sh  >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
echo "Total Full Size: " >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt;
du -hs "/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_2021-05-05_11-42-39/" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
echo "" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
echo "" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
echo "" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
df -h | grep -e "Used" -e "usbback" >> /mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt
sendEmail -s mail.ssjfinance.com:25 -f postmaster@ssjfinance.com -t devdas.yadav@ssjfinance.com -bcc support@technoinfotech.com -u "onedrivedev-backup Version Backup Status" -o message-file=/mnt/onedrivebackup/onedrivedev-version-backup/onedrivedev-backup_latest_report.txt -a /tmp/rclone-log.txt 
