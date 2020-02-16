@echo off
echo.
echo Pulling images from DOCKER HUB
call dockerPullImages.cmd
echo.
if not exist ".\logs" mkdir .\logs
echo Starting DEVELOPER containers
call docker-compose -f docker-compose.yml -f docker-compose.vpnfriendly.yml up -d
