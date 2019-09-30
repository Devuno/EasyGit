$decktopvar = [Environment]::GetFolderPath("Desktop")
$RepoName = "EasyGit"
cd $decktopvar + "\GitHub\$RepoName\"
rm ~\GitRun.ps1 -erroraction 'silentlycontinue'
rm ..\gitRun.link.bat -erroraction 'silentlycontinue'
rm ..\gitUpdate.link.bat -erroraction 'silentlycontinue'
rm ..\gitCommit.link.bat -erroraction 'silentlycontinue'
rm ..\gitStatus.link.bat -erroraction 'silentlycontinue'
rm ..\GitUpdate.ps1 -erroraction 'silentlycontinue'
rm ..\GitRun.ps1 -erroraction 'silentlycontinue'
rm .\UnSetup.link.bat -erroraction 'silentlycontinue'