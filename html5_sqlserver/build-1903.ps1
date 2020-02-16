& docker-compose -f ../docker-compose.yml -f ../docker-compose.yml -f ../docker-compose.sqlbuild1903.yml up -d

Write-Host -NoNewline "Press enter when all containers have finished"
$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

& docker-compose -f ../docker-compose.yml -f ../docker-compose.yml -f ../docker-compose.sqlbuild1903.yml stop
& docker commit mssql_docker beumergroup/html5_sqlserver:1903
& docker-compose -f ../docker-compose.yml -f ../docker-compose.yml -f ../docker-compose.sqlbuild1903.yml rm