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
set /P i=是否包含运行时发布?(y/n)
if not "%i%"=="y" goto start
@echo 详细的运行时RID请访问
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo 常用运行时RID
@echo win7-x64,win10-x64,ubuntu.16.04-x64,centos.7-x64,osx.10.12-x64
set /P r=输入运行时 RID:
:start
dotnet restore
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    dotnet publish-zkeacms
)
if "%i%"=="y" (
    dotnet publish-zkeacms %r%
)

explorer %cd%\bin\Release\PublishOutput