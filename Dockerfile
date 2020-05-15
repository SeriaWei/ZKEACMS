FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder
WORKDIR /build
# Copy all files
COPY . ./
RUN dotnet restore
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install --global ZKEACMS.Publisher
RUN dotnet tool install --global sqlite-exec
# Release ZKEACMS.WebHost
WORKDIR /build/src/ZKEACMS.WebHost
RUN publish-zkeacms

# Create database
RUN mkdir /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/App_Data
RUN sqlite-exec -d /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/App_Data/Database.sqlite -f /build/DataBase/SQLite/ZKEACMS.sqlite.sql
RUN cp -f /build/DataBase/SQLite/appsettings.json /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/appsettings.json

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
