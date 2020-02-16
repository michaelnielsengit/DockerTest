$ErrorActionPreference = 'Stop'
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

Write-Information "Changing SA login credentials"

& sqlcmd -q "ALTER LOGIN sa with password='1Password';ALTER LOGIN sa ENABLE;" -l 60
& sqlcmd -i PerfConf.sql -l 60