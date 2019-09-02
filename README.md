# EasyGit

this repository contains custom powershell scripts to aid in my own git management
#it creates a github folder in your desktop directory (*PSA please use [Environment]::GetFolderPath("Desktop") instead of $home or ~\Desktop etc. This makes sure you get the Actual Desktop and not some half copy)

*this currently only does basic pulls and push to repositories
these scripts let you manage all your repositories at once
(mass git clone, mass git pull, mass git commit)

this is all done through powershell scripts and bat file links for convenience it also places a powershell link called git run in the user home directory for convenience when you start powershell (GitSetup.ps1 or Setup.bat needs to be run to enable it)

The above can be undone with (GitUninstall.ps1)

GitRun.ps1 is a script that git clones all the url's that you give it in a comma seperated list

GitUpdate.ps1 updates all the gits in the github folder

GitCommit.ps1 gets the git status of the specified directory then commits and creates a push.bat script to upload it

GitStatus.ps1 gets all the statuses of the repositories in the github directory


Design goals:
  - fast to use
  - dont accdentally fudge over other repo's
  - nothing to compile
  - ability to update its self without artifacts
  - learn git
