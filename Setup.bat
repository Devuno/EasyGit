@echo off
Powershell.exe -executionpolicy remotesigned -File .\GitSetup.ps1
Powershell.exe -executionpolicy remotesigned -File %UserProfile%\GitRun.ps1 "https://github.com/Devuno/EasyGit.git"
