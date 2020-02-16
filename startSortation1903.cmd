@echo off
echo Starting SORTATION container
call docker-compose -f docker-compose.yml -f docker-compose.vpnfriendly.yml -f docker-compose.1903.yml -f docker-compose.sortation.yml up -d
