FROM mcr.microsoft.com/windows/servercore:1903

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY install/ /

WORKDIR /

RUN .\install.cmd; Remove-Item -Recurse -Force vc_redist.x64.exe, msodbcsql.msi, mssqlcmd.msi;