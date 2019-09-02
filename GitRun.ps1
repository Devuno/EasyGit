
$GitUrlfile = ".\GitUrls.txt"

Function gitfiletxt # gets the content of a file used to store url's
    {
    $gitfile = ""
    try
        {
        $gitfile = Get-Content $GitUrlfile -erroraction 'silentlycontinue'
        }
    catch
        {
        Read-Host "$pwd Giturls.txt error"
        exit
        }
    if ($gitfile -eq $null) 
    {
    $gitfile = ""
    }
    return $gitfile
    }

Function MakeUrllink
{
Param ([string]$givenurl,[string]$name)
Write-Host ('|' + $givenurl + '|')
Write-Host ('|' + $name + '|')
rm (".\" + $name) -erroraction 'silentlycontinue'
New-Item (".\" + $name + ".url")
Set-Content (".\" + $name + ".url") "[{000214A0-0000-0000-C000-000000000046}]
Prop3=19,2
[InternetShortcut]
IDList=
URL=$givenurl"
return
}

Function MakeAllUrls
{
$folder = "A Urls\"
mkdir $folder
foreach ($gitulr in $githubs)
    {
        if($gitulr -ne "")
        {
        MakeUrllink -givenurl $gitulr -name ($folder +("$gitulr".Split("/")[("$gitulr".Split("/").Length)-1]))
        }
    }
}



$DesktopPath = [Environment]::GetFolderPath("Desktop")
if ((test-path -Path $DesktopPath) -eq $false) {exit}
cd $DesktopPath
mkdir GitHub -erroraction 'silentlycontinue'
ls .\GitHub -Depth 1
cd GitHub 
$githubs = New-Object "System.Collections.Generic.List[String]"
$Uinput = $null
if($args[0] -ne $null -and $args[0] -ne ""){$Uinput = $args[0]}
else
{$Uinput = Read-Host "Type in Github urls seperated by a Comma ',' "}
$gitinput = ""
if ($Uinput -eq "") #gets the url's from the giturl's txt file
    {
    $gitinput = gitfiletxt
    }
elseif ($Uinput -eq "exit") {exit} #exit command
elseif ($Uinput -eq "logs") #prints the logs
    {
    write-host "" 
    Get-Content .\logs.txt
    exit
    }
else
    {
    $gitinput = $Uinput
    }


$gitraw = $gitinput.Replace("`n"," ").Split(',')
foreach ($gitulr in $gitraw)
    {
    $githubs.Add($gitulr.Trim())
    }

#any new url's?
if($Uinput -ne "")
    { 
    $newurl = $false
    foreach ($gitulr in $githubs)
        {
        $dirtyurllist = gitfiletxt   
            if ($dirtyurllist.ToString() -match $gitulr -eq $false)
                {
                Write-Host "this is the new url $gitulr"
                $newurl = $true
                break
                }
        }
    if ($newurl -eq $true)
        {
        if ((Read-Host "Add urls to file ? y/n") -eq "y") #want to add url's?
            {
            $dirtyurllist = gitfiletxt
            foreach ($gitulr in $githubs)
                {
        
                if ($dirtyurllist.ToString() -match $gitulr -eq $false)
                    {
                    #",`n$gitulr" | Out-file -Append $GitUrlfile
                    ",$gitulr" | Out-file -Append $GitUrlfile
                    }
                }
            }
}
}

rm .\logs.txt
foreach ($gitulr in $githubs)
    {
    git clone $gitulr 2>> .\logs.txt
    }
# MakeAllUrls
