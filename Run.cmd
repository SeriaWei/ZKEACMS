@echo off
echo ASPNETCORE_ENVIRONMENT=Development
set ASPNETCORE_ENVIRONMENT=Development

if not exist "src/ZKEACMS.WebHost/bin/Debug/netcoreapp2.0/ZKEACMS.WebHost.dll" (
call Build.cmd
)

cd src/ZKEACMS.WebHost
dotnet bin/Debug/netcoreapp2.0/ZKEACMS.WebHost.dll