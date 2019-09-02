$decktopvar = [Environment]::GetFolderPath("Desktop")
$RepoName = "EasyGit"
Function gitlinkbat 
{
Param ([string]$placepathname, [string]$target)
write-host $placepathname
Write-Host $target
rm "$placepathname.bat" -erroraction 'silentlycontinue'
New-Item "$placepathname.bat"
Set-Content "$placepathname.bat" ("@echo off
Powershell.exe -executionpolicy remotesigned -File " + $decktopvar + "\GitHub\$RepoName\$target.ps1
pause")
return
}

Function gitlinkps1
{
Param ([string]$placepathname, [string]$target)
rm $placepathname -erroraction 'silentlycontinue'
New-Item $placepathname
Set-Content $placepathname $target
return
}

Function DirCorrect
{
#autoplaces it'self in the right directory
mkdir ($decktopvar + "\GitHub")
Copy-Item -Recurse ..\GitScripts ($decktopvar + "\GitHub\") -erroraction 'silentlycontinue'
cd ($decktopvar + "\GitHub\$RepoName\")
return
}
DirCorrect
#gitrun home
gitlinkps1 -placepathname "~\GitRun.ps1" -target ($decktopvar + "\GitHub\$RepoName\GitRun.ps1 "+'$args[0]')
#gitrun
gitlinkbat -placepathname "..\gitCommit.link" -target "GitCommit"
gitlinkbat -placepathname "..\gitRun.link" -target "GitRun"
gitlinkbat -placepathname "..\gitUpdate.link" -target "GitUpdate"
gitlinkbat -placepathname "..\gitStatus.link" -target "GitStatus"