<?php
error_reporting( E_ERROR );
ob_flush();
flush();


$dobk=0;
$source_folder=$argv[1];
$des_folder=$argv[2];
$backup_title=$argv[3];
$pass_file=$argv[4];

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
$cmdx="rsync -av  \"".$source_folder."\" \"".$des."/\" --link-dest=\"".$latest_link."\"";

print $cmdx."\n";


$cmdx="rm \"".$latest_link."\" ;  ln -vs \"".$des."/\" \"".$latest_link."\"";
print $cmdx."\n";

print "\n";
}

?>
