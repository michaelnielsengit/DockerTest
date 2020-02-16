@echo off
echo.
echo Pulling images from DOCKER HUB
call dockerPullImages.cmd
echo.
if not exist ".\logs" mkdir .\logs
echo Starting DEVELOPER containers
call docker-compose up -d
