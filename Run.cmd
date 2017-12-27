@echo off
WHERE /Q dotnet
IF %ERRORLEVEL% NEQ 0 (
ECHO dotnet core sdk was not find, please install the latest sdk at first.
@pause
start https://www.microsoft.com/net/download/windows
exit
)
echo ASPNETCORE_ENVIRONMENT=Development
set ASPNETCORE_ENVIRONMENT=Development

if not exist "src/ZKEACMS.WebHost/bin/Debug/netcoreapp2.0/ZKEACMS.WebHost.dll" (
call Build.cmd
)

cd src/ZKEACMS.WebHost
dotnet bin/Debug/netcoreapp2.0/ZKEACMS.WebHost.dll