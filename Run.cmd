@echo off
WHERE /Q dotnet
IF %ERRORLEVEL% NEQ 0 (
ECHO dotnet core sdk was not find, please install the latest sdk at first.
@pause
start https://www.microsoft.com/net/download/windows
exit
)
if not exist "src/ZKEACMS.WebHost/bin/Debug/netcoreapp3.0/ZKEACMS.WebHost.dll" (
call Build.cmd
)

cd src/ZKEACMS.WebHost
call Run.cmd