@PowerShell -executionpolicy remotesigned -Command Invoke-Expression $('$args=@(^&{$args} %*);'+[String]::Join([char]10,(Get-Content '%~f0') -notmatch '^^@PowerShell.*EOF$')) & goto :EOF

Read-Host "Crafty Bugger"
$hello = "it's yaboy"
Read-Host $hello