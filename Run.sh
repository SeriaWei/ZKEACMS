#!/bin/sh
if ! [ -x "$(command -v dotnet)" ]; then
  echo 'dotnet core sdk was not find, please install the latest sdk at first.'
  exit 1
fi
file="src/ZKEACMS.WebHost/bin/Debug/netcoreapp3.0/ZKEACMS.WebHost.dll"
if ! [ -f "$file" ];then
    dotnet build ZKEACMS.sln
fi
cd src/ZKEACMS.WebHost
echo Starting...
ASPNETCORE_ENVIRONMENT="Development" ASPNETCORE_URLS="http://localhost:5000" dotnet bin/Debug/netcoreapp3.0/ZKEACMS.WebHost.dll