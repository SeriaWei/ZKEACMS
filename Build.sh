#!/bin/sh
if ! [ -x "$(command -v dotnet)" ]; then
  echo 'dotnet core sdk was not find, please install the latest sdk at first.'
  exit 1
fi
echo Build starting...
dotnet build ZKEACMS.sln