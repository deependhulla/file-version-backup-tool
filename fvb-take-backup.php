<?php
error_reporting( E_ERROR );
ob_flush();
flush();


$dobk=0;
$source_folder=$argv[1];
$des_folder=$argv[2];
$backup_title=$argv[3];


if($source_folder !="" && $des_folder!="" && $backup_title!="")
{
$dobk=1;
}
if($dobk==0)
{
print "Syntax for backup : \nphp fvb-take-backup.php <SOURCE_FOLDER> <DEST_FOLDER> <BACKUP_TITLE> \n";
print "Example : \nphp fvb-take-backup.php \"/home/mailadmin/Documents\" \"/home/mailadmin/timebackup\" \"dvddocs\" \n";
}

if($dobk==1)
{
$cdate=date('Y-m-d_H-i-s');
$inprogess_folder="";
$des=$des_folder."/".$backup_title."_".$cdate;
$latest_link=$des_folder."/".$backup_title."_latest_link";
$latest_rep=$des_folder."/".$backup_title."_latest_report.txt";
$rep=$des_folder."/".$backup_title."_".$cdate."_report.txt";
$cmdx="echo \"Backup Started :\" > ".$latest_rep." ; date >> ".$latest_rep."";
print $cmdx."\n";

$cmdx="rsync -av  \"".$source_folder."\" \"".$des."/\" --link-dest=\"".$latest_link."\"";
print $cmdx."\n";
$cmdx="rm \"".$latest_link."\" ;  ln -vs \"".$des."/\" \"".$latest_link."\"";
print $cmdx."\n";
$cmdx="echo \"Backup Ended :\" >> ".$latest_rep." ; date >> ".$latest_rep."";
print $cmdx."\n";
$cmdx="find \"".$des."/\" -type f -links 1 -exec du -sh  {} \; > \"".$rep."\"";
print $cmdx."\n";

$cmdx="echo \"Backup Size: \" >> ".$latest_rep.";";
print $cmdx."\n";
$cmdx="cat ".$rep." | sed 's/\t//g' |cut -d \"/\" -f 1 | sort -n | paste -s -d+ - | bc | ./kb-to-mb-or-gb.sh  >> ".$latest_rep."";
print $cmdx."\n";
$cmdx="echo \"Total Full Size: \" >> ".$latest_rep.";";
print $cmdx."\n";
$cmdx="du -hs \"".$des."/\" >> ".$latest_rep."";
print $cmdx."\n";
$cmdx="echo \"\" >> ".$latest_rep."";print $cmdx."\n";
$cmdx="echo \"\" >> ".$latest_rep."";print $cmdx."\n";
$cmdx="echo \"\" >> ".$latest_rep."";print $cmdx."\n";

$cmdx="df -h | grep -e \"Used\" -e \"usbback\" >> ".$latest_rep."";
print $cmdx."\n";


$cmdx="sendEmail -f postmaster@ssjfinance.com -t devdas.yadav@ssjfinance.com -bcc support@technoinfotech.com -u \"".$backup_title." Version Backup Status\" -o message-file=".$latest_rep." -a /tmp/rclone-log.txt ";
print $cmdx."\n";

}

?>
