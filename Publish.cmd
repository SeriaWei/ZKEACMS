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
@echo .NET Core 运行时标识符 (RID) 目录
@echo https://docs.microsoft.com/zh-cn/dotnet/articles/core/rid-catalog
@echo -----------------------------------------------------------------------------
@pause
for /f %%a in ('dir src /b') do (
	@echo ------------------ Build %%a ------------------
	cd src/%%a
	dotnet build
	cd ../../
)
@echo ------------------ Release ------------------
cd src/ZKEACMS.WebHost
dotnet publish -c Release -o ./bin/Release/PublishOutput
cd ../../
cd PluginPublisher
dotnet restore
dotnet run
cd ../
set current_path=%cd%
explorer %current_path%\src\ZKEACMS.WebHost\bin\Release\PublishOutput