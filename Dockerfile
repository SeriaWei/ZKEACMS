FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /build

# Copy csproj and restore as distinct layers
COPY . ./
RUN cd /build/src/ZKEACMS.WebHost
RUN dotnet publish -c Release -o ./bin/Release/PublishOutput
RUN cd /build/src/ZKEACMS.Article
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Article

#Release ZKEACMS.FormGenerator
RUN cd /build/src/ZKEACMS.FormGenerator
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.FormGenerator

#Release ZKEACMS.Message
RUN cd /build/src/ZKEACMS.Message
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Message

#Release ZKEACMS.Product
RUN cd /build/src/ZKEACMS.Product
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Product

#Release ZKEACMS.Redirection
RUN cd /build/src/ZKEACMS.Redirection
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Redirection

#Release ZKEACMS.SectionWidget
RUN cd /build/src/ZKEACMS.SectionWidget
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.SectionWidget

#Release ZKEACMS.Shop
RUN cd /build/src/ZKEACMS.Shop
RUN dotnet publish -c Release -o ../ZKEACMS.WebHost/bin/Release/PublishOutput/wwwroot/Plugins/ZKEACMS.Shop

RUN cd /build/src/PluginPublisher
RUN dotnet restore
RUN dotnet build
RUN dotnet run

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]