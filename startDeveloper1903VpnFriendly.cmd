@echo off
echo.
if not exist ".\logs" mkdir .\logs
echo Starting DEVELOPER containers
call docker-compose -f docker-compose.yml -f docker-compose.vpnfriendly.yml -f docker-compose.1903.yml up -d
