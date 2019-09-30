. .\GitRun.ps1

$DesktopPath = [Environment]::GetFolderPath("Desktop")
cd $DesktopPath + "\GitHub\"
$gitinput = (gitfiletxt).Replace("`n"," ").Split(',')
foreach ($gitulr in $gitraw)
    {
    $githubs.Add($gitulr.Trim())
    }

MakeAllUrls -gitallurl $githubs
# MakeAllUrls
