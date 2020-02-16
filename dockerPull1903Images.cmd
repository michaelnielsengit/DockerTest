@echo off
:: ############################################################
:: ###  NOTE - NOTE - NOTE - NOTE - NOTE - NOTE - NOTE      ###
:: ###  This script is used by other scripts (unattended)   ###
:: ###  DO NOT insert blocking operations such as PAUSE !!  ###
:: ############################################################

:: Pull latest baseimage
:PULL_BASEIMAGE
echo.
echo Pull latest baseimage
docker pull beumergroup/html5_baseimage:1903
if not "%ERRORLEVEL%"=="0" goto PULL_BASEIMAGE

:: Pull latest sqlserver
:PULL_SQLSERVER
echo.
echo Pull latest sqlserver
docker pull beumergroup/html5_sqlserver:1903
if not "%ERRORLEVEL%"=="0" goto PULL_SQLSERVER

:: Pull latest sorter5base
:PULL_SORTER
echo.
echo Pull latest sorter5base
docker pull beumergroup/html5_sorter5base:1903
if not "%ERRORLEVEL%"=="0" goto PULL_SORTER

:: Pull latest sac4base
:PULL_SAC
echo.
echo Pull latest sac4base
docker pull beumergroup/html5_sac4base:1903
if not "%ERRORLEVEL%"=="0" goto PULL_SAC

:: Pull latest bgalarmlink
:PULL_BGALARMLINK
echo.
echo Pull latest bgalarmlink
docker pull beumergroup/html5_bgalarmlink:1903
if not "%ERRORLEVEL%"=="0" goto PULL_BGALARMLINK

:: Pull latest bgcws
:PULL_BGCWS
echo.
echo Pull latest bgcws
docker pull beumergroup/html5_bgcws:1903
if not "%ERRORLEVEL%"=="0" goto PULL_BGCWS

:: Pull latest statisticserver
:: :PULL_STAT
:: echo.
:: echo Pull latest statisticserver
:: docker pull beumergroup/html5_statisticserver:latest
:: if not "%ERRORLEVEL%"=="0" goto PULL_STAT

:: Pull latest logserver
:PULL_LOGSERVER
echo.
echo Pull latest logserver
docker pull beumergroup/html5_logserver:1903
if not "%ERRORLEVEL%"=="0" goto PULL_LOGSERVER

echo.
echo All images pulled succesfully
