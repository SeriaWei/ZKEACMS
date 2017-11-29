FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /build

# Copy csproj and restore as distinct layers
COPY . ./
WORKDIR /build/src/ZKEACMS.WebHost
RUN dotnet publish -c Release -o ./bin/Release/PublishOutput

# Copy appsettings.json
RUN cp -f /build/DataBase/MySql/appsettings.json /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/appsettings.json

#Release ZKEACMS.Article
WORKDIR /build/src/ZKEACMS.Article
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Article

#Release ZKEACMS.FormGenerator
WORKDIR /build/src/ZKEACMS.FormGenerator
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.FormGenerator

#Release ZKEACMS.Message
WORKDIR /build/src/ZKEACMS.Message
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Message

#Release ZKEACMS.Product
WORKDIR /build/src/ZKEACMS.Product
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Product

#Release ZKEACMS.Redirection
WORKDIR /build/src/ZKEACMS.Redirection
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Redirection

#Release ZKEACMS.SectionWidget
WORKDIR /build/src/ZKEACMS.SectionWidget
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.SectionWidget

#Release ZKEACMS.Shop
WORKDIR /build/src/ZKEACMS.Shop
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Shop

#Release ZKEACMS.Sitemap
WORKDIR /build/src/ZKEACMS.Sitemap
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Sitemap

WORKDIR /build/PluginPublisher
RUN dotnet restore
RUN dotnet build
RUN dotnet run



# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]