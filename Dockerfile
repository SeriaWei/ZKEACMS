FROM mcr.microsoft.com/dotnet/sdk:5.0 AS builder
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
RUN sqlite-exec -d /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/App_Data/Database.sqlite -f /build/Database/SQLite/ZKEACMS.sqlite.sql
RUN cp -f /build/Database/SQLite/appsettings.json /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/appsettings.json

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
RUN apt update -y
RUN apt install libicu-dev libgdiplus -y
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
