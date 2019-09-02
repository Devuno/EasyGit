$DesktopPath = [Environment]::GetFolderPath("Desktop")
if ((test-path -Path $DesktopPath) -eq $false) {exit}
cd $DesktopPath
mkdir GitHub -erroraction 'silentlycontinue'
cd GitHub 


dir -Directory |
    ForEach-Object {
        cd .\$_
        $_
        git status
        cd ..
    }