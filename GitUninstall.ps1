$decktopvar = [Environment]::GetFolderPath("Desktop")
$RepoName = "EasyGit"
cd $decktopvar + "\GitHub\$RepoName\"
rm ~\GitRun.ps1
rm ..\gitRun.link.bat
rm ..\gitUpdate.link.bat
rm ..\gitCommit.link.bat
rm ..\gitStatus.link.bat
rm ..\GitUpdate.ps1
rm ..\GitRun.ps1