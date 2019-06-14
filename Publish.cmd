@echo off
@echo -----------------------------------------------------------------------------
@echo *** Welcome to use ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo This tool will help you to publish ZKEACMS
@echo License
@echo http://www.zkea.net/licenses
@echo -----------------------------------------------------------------------------
@echo Deploy
@echo http://www.zkea.net/zkeacms/document/deploy/core
@echo -----------------------------------------------------------------------------
@echo RID details
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo -----------------------------------------------------------------------------
@echo Notice: Application will publish to folder(src/ZKEACMS.WebHost/bin/Release/PublishOutput)
WHERE /Q dotnet
IF %ERRORLEVEL% NEQ 0 (
@echo dotnet core sdk was not find, please install the latest sdk at first.
@pause
start https://www.microsoft.com/net/download/windows
exit
)
WHERE /Q publish-zkeacms
IF %ERRORLEVEL% NEQ 0 (
@echo Installing publish tool, please wait.
dotnet tool install --global ZKEACMS.Publisher --version 1.5.6-preview3.0
)
@pause
@echo Publishing, please wait...
dotnet restore
cd src/ZKEACMS.WebHost
publish-zkeacms
explorer %cd%\bin\Release\PublishOutput