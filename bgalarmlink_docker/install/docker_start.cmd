
@echo off
echo --- Running environment
ipconfig
set
call docker_env.cmd

echo --- Updating environment configuration for %ENVIRONMENT%
if "%ENVIRONMENT%" == "demoserver" (
  echo Setting up 'demoserver' environment
	copy /Y c:\install\environment_demoserver.xml c:\systems\bgalarmlink\conf\environment.xml
) else if "%ENVIRONMENT%" == "developer" (
  echo Setting up 'developer' environment
	copy /Y c:\install\environment_developer.xml c:\systems\bgalarmlink\conf\environment.xml
) else (
	echo ERROR: Unknown environment %ENVIRONMENT%. Possible options: developer, demoserver
	exit 1
)


rem Set signals must run after the alarmlink is running, so use the ping to create a delay that doesn't require tty
start cmd /c "cd C:\install && ping 127.0.0.1 -n 40 > nul && call setSignals.cmd"

echo --- Starting BGALARMLINK
call c:\systems\packages\bgplatform\bgplatform-8.2.35.0\bin\BGTaskMgr.exe -i -approot=C:\systems\bgalarmlink\conf -appid=alarmlink
