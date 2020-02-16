@echo off
echo.
echo Pulling images from DOCKER HUB
call dockerPullImages.cmd
echo.
echo Starting DEMOSERVER containers
START docker-compose -f docker-compose.demoserver.yml --no-ansi up
