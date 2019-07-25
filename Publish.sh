#!/bin/sh
echo "-----------------------------------------------------------------------------"
echo "*** Welcome to use ZKEACMS ***"
echo "-----------------------------------------------------------------------------"
echo T"his tool will help you to publish ZKEACMS"
echo "License"
echo "http://www.zkea.net/licenses"
echo "-----------------------------------------------------------------------------"
echo "Deploy"
echo "http://www.zkea.net/zkeacms/document/deploy/core"
echo "-----------------------------------------------------------------------------"
echo "RID details"
echo "https://docs.microsoft.com/en-us/dotnet/core/rid-catalog"
echo "-----------------------------------------------------------------------------"
echo "Notice: Application will publish to folder(src/ZKEACMS.WebHost/bin/Release/PublishOutput)"
read -p "Press enter to continue"

if ! [ -x "$(command -v publish-zkeacms)" ]; then
  echo 'Installing publish tool, please wait.'
  dotnet tool install --global ZKEACMS.Publisher --version 1.5.6-preview3.0
fi
dotnet restore
cd src/ZKEACMS.WebHost
export PATH="$PATH:/root/.dotnet/tools"
publish-zkeacms