@echo off
@echo -----------------------------------------------------------------------------
@echo *** 欢迎使用 ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo 该工具将帮助您发布您的 ZKEACMS 程序
@echo 在开始之前请您先查看我们的许可协议
@echo http://www.zkea.net/licenses
@pause
cd src/ZKEACMS.WebHost
dotnet publish -o ./bin/Release/PublishOutput
cd ../../
cd PluginPublisher
dotnet restore
dotnet run
cd ../
set current_path=%cd%
explorer %current_path%\src\ZKEACMS.WebHost\bin\Release\PublishOutput