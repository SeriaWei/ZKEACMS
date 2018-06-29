@echo off
@echo -----------------------------------------------------------------------------
@echo *** 欢迎使用 ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo 该工具将帮助您发布您的 ZKEACMS 程序
@echo 在开始之前请您先查看我们的许可协议
@echo http://www.zkea.net/licenses
@echo -----------------------------------------------------------------------------
@echo 部署相关请访问
@echo http://www.zkea.net/zkeacms/document/deploy/core
@echo -----------------------------------------------------------------------------
@echo 注意：发布时会清空发布目录
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
set /P i=是否包含运行时发布?(y/n)
if not "%i%"=="y" goto start
@echo 详细的运行时RID请访问
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo 常用运行时RID: win-x64,linux-x64
set /P r=输入运行时 RID:
:start
@echo 正在发布，请稍后...
dotnet restore
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    publish-zkeacms
)
if "%i%"=="y" (
    publish-zkeacms -r %r%
)

explorer %cd%\bin\Release\PublishOutput