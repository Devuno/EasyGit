$DesktopPath = [Environment]::GetFolderPath("Desktop")
if ((test-path -Path $DesktopPath) -eq $false) {exit}
cd $DesktopPath
mkdir GitHub -erroraction 'silentlycontinue'
cd GitHub 

Function pushupdate
{

    Write-Host "######################################################################################`n$pwd `n######################################################################################"
    git status
    Write-Host "`n`n`n"
    if ((Read-Host "Update contents of directory?:y/n") -eq "y") 
        {    
        git add *
        git status
        git commit -m (Read-Host "Please add your comments for this update")
        Pushbat -placepath "GitPush"
        }
    return
}

Function Directoryscroll
{
dir -Directory |
    ForEach-Object {
        cd .\$_
        pushupdate
        cd ..
        
    }
    return
}


Function Pushbat
#This creates a self destructing git push bat file
{
Param ([string]$placepath)
rm "$placepath.bat" -erroraction 'silentlycontinue'
New-Item "$placepath.bat"
Set-Content "$placepath.bat" ("@echo off
git push
echo #  Complete  #
Timeout 20
del $placepath.bat")
}

Function ToughTest-Path{
#a toughened version of the Test-Path function
$givpath = $args[0]
Write-Host $args[0]
if((($givpath -ne "") -And ($givpath -ne $null)))
{
return (Test-Path $givpath)
}
}

$givenpath = Read-Host "Please specify a directory name"
if(ToughTest-Path $givenpath){    
    cd $givenpath 
    pushupdate
    cd $DesktopPath
    cd GitHub 
    }
    else
    {
    if((Read-Host "do you want to scroll through all the directories? y/n") -eq "y")
        {
        Directoryscroll
        }
    }
