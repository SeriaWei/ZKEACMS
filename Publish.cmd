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
@echo Notice: Output folder(src/ZKEACMS.WebHost/bin/Release/PublishOutput) will be cleaned when publish start
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
dotnet tool install -g ZKEACMS.Publisher
)
set /P i=Publish witch runtime?(y/n)
if not "%i%"=="y" goto start
@echo RID details
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
set /P r=Input RID:
:start
@echo Publishing, please wait...
dotnet restore
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    publish-zkeacms
)
if "%i%"=="y" (
    publish-zkeacms -r %r%
)

explorer %cd%\bin\Release\PublishOutput