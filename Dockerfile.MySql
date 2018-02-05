FROM microsoft/aspnetcore-build:latest AS builder
WORKDIR /build
# Copy all files
COPY . ./
RUN dotnet restore

WORKDIR /build/src/ZKEACMS.WebHost
RUN dotnet publish-zkeacms

# Copy appsettings.json
RUN cp -f /build/DataBase/MySql/appsettings.json /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/appsettings.json

# Build runtime image
FROM microsoft/aspnetcore:latest
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]