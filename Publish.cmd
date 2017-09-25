@echo off
@echo -----------------------------------------------------------------------------
@echo *** 欢迎使用 ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo 该工具将帮助您发布您的 ZKEACMS 程序
@echo 在开始之前请您先查看我们的许可协议
@echo http://www.zkea.net/licenses
@echo -----------------------------------------------------------------------------
@echo 有关于.Net Core应用程序的安装部署，请查看 Microsoft Docs
@echo .NET Core 应用程序部署
@echo https://docs.microsoft.com/zh-cn/dotnet/articles/core/deploying
@echo -----------------------------------------------------------------------------
@echo 注意：发布时会清空发布目录
set /P i=是否包含运行时发布?(y/n)
if not "%i%"=="y" goto start
@echo ------------------------- 详细的运行时RID请访问 -------------------------
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo -------------------------  常用运行时 RID  -------------------------
@echo win7-x64,win10-x64,ubuntu.16.04-x64,centos.7-x64,osx.10.12-x64
set /P r=输入运行时 RID:
:start
set output=%cd%\src\ZKEACMS.WebHost\bin\Release\PublishOutput
if exist "%output%" (
@echo ------------------- Clean Publish Output -------------------
rd/s/q "%output%"
)
@echo ------------------ Release ------------------
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    dotnet publish -c Release -o ./bin/Release/PublishOutput
)
if "%i%"=="y" (
    dotnet publish -c Release -o ./bin/Release/PublishOutput -r %r%
)
cd ../../
for /f %%a in ('dir src /b') do (
	if exist "src/%%a/zkea.plugin" (
        @echo Publish plugin %%a
        cd src/%%a
        dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/%%a
        cd ../../
    )
)
cd PluginPublisher
dotnet build
dotnet run
cd ../
set current_path=%cd%
explorer %current_path%\src\ZKEACMS.WebHost\bin\Release\PublishOutput