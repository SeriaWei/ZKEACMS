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
@echo 注意：发布前将清空发布目录
@pause
@echo ------------------- Clean Publish Output -------------------
set current_path=%cd%
rd/s/q "%current_path%\src\ZKEACMS.WebHost\bin\Release\PublishOutput"
@echo ------------------- Build -------------------
dotnet build -c Release ZKEACMS.sln
@echo ------------------ Release ------------------
cd src/ZKEACMS.WebHost
dotnet publish -c Release -o ./bin/Release/PublishOutput
cd ../../
cd PluginPublisher
dotnet run
cd ../
set current_path=%cd%
explorer %current_path%\src\ZKEACMS.WebHost\bin\Release\PublishOutput