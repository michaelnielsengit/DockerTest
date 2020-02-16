call C:\vc_redist.x64.exe /quiet /install

call msiexec /i C:\msodbcsql.msi /qn /passive IACCEPTMSODBCSQLLICENSETERMS=YES /L*V "C:\obdclog.log"
call msiexec /i C:\mssqlcmd.msi /qn /passive IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES /L*V "C:\mssqllog.log"

copy "C:\OSQL.EXE" "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn"
copy "C:\osql.rll" "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn\Resources\1033"

setx PERLHOME "\packages\perl\perl-5.12.3-win"
