@echo off
@echo Wait...
cd src/ZKEACMS.WebHost
dotnet publish -o ./bin/Release/PublishOutput
cd ../../
cd PluginPublisher
dotnet run