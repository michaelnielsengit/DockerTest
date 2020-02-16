call docker_env.cmd

sqlcmd -S %DBSERVERNAME% -U %DBSERVERUSERNAME% -P %DBSERVERPASSWORD% -i mssql_createdb.sql -l 60
sqlcmd -S %DBSERVERNAME% -U %DBSERVERUSERNAME% -P %DBSERVERPASSWORD% -d %DBNAME% -i mssql_create.sql -l 60
sqlcmd -S %DBSERVERNAME% -U %DBSERVERUSERNAME% -P %DBSERVERPASSWORD% -d %DBNAME% -i recreate_subscriptions.sql -l 60
