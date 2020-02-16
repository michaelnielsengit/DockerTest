Write-Host ""
Start-Transcript -Path ".\restartDemoserver_jenkins.log"
Write-Host ""

Write-Host "##########  DEMOSERVER - CURRENT TIME  ##########"
Get-Date
Write-Host ""
Write-Host "##########  DEMOSERVER - CURRENT DIR  ##########"
Get-Location

Write-Host "##########  DEMOSERVER - IMAGES (Before PULL)  ##########"
Write-Host ""
& docker images 2>&1 | Out-Host
Write-Host ""
Write-Host "##########  DEMOSERVER - CONTAINERS (Running)  ##########"
Write-Host ""
& docker ps 2>&1 | Out-Host
Write-Host ""

Write-Host "##########  DEMOSERVER - STOPPING  ##########"
& .\stopDemoserver.cmd
Write-Host ""
Write-Host "##########  DEMOSERVER - STARTING  ##########"
& .\startDemoserver.cmd
Write-Host ""

Write-Host "##########  DEMOSERVER - IMAGES (After PULL)  ##########"
Write-Host ""
& docker images 2>&1 | Out-Host
Write-Host ""
Write-Host "##########  DEMOSERVER - WAIT FOR CONTAINERS STARTED  ##########"
Write-Host ""
$waitsecs = 30
Write-Host "Waiting $waitsecs seconds for containers to be started"
Start-Sleep -Seconds $waitsecs
Write-Host ""
Write-Host "##########  DEMOSERVER - CONTAINERS (Running)  ##########"
Write-Host ""
& docker ps 2>&1 | Out-Host

Write-Host ""
Stop-Transcript
