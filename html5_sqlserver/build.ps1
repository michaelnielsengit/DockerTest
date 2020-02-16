& docker-compose -f ../docker-compose.yml -f ../docker-compose.sqlbuild.yml up -d

Write-Host -NoNewline "Press enter when all containers have finished"
$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

& docker-compose -f ../docker-compose.yml -f ../docker-compose.sqlbuild.yml stop
& docker commit mssql_docker beumergroup/html5_sqlserver:latest
& docker-compose -f ../docker-compose.yml -f ../docker-compose.sqlbuild.yml rm