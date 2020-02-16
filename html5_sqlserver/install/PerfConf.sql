EXEC sp_configure 'show advanced options', 1
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'min_server_memory', 128
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'max_server_memory', 512
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'max degree of parallelism', 1
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'show advanced options', 0
RECONFIGURE WITH OVERRIDE