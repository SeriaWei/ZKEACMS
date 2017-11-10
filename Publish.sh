echo ------------------ Clean PublishOutput ------------------
rm -rf ./src/ZKEACMS.WebHost/bin/Release/PublishOutput
echo ------------------ Release ------------------
cd ./src/ZKEACMS.WebHost
dotnet publish -c Release -o ./bin/Release/PublishOutput
echo ------------------ Release ZKEACMS.Article ------------------
cd ../../src/ZKEACMS.Article
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Article

echo ------------------ Release ZKEACMS.FormGenerator ------------------
cd ../../src/ZKEACMS.FormGenerator
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.FormGenerator

echo ------------------ Release ZKEACMS.Message ------------------
cd ../../src/ZKEACMS.Message
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Message

echo ------------------ Release ZKEACMS.Product ------------------
cd ../../src/ZKEACMS.Product
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Product

echo ------------------ Release ZKEACMS.Redirection ------------------
cd ../../src/ZKEACMS.Redirection
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Redirection

echo ------------------ Release ZKEACMS.SectionWidget ------------------
cd ../../src/ZKEACMS.SectionWidget
dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.SectionWidget

cd ../../PluginPublisher
dotnet restore
dotnet build
dotnet run
echo Published successfully: src/ZKEACMS.WebHost/bin/Release/PublishOutput