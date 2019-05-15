FROM microsoft/dotnet:2.2.100-sdk AS builder
WORKDIR /build
# Copy all files
COPY . ./
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet restore
RUN dotnet tool install -g ZKEACMS.Publisher
# Release ZKEACMS.WebHost
WORKDIR /build/src/ZKEACMS.WebHost
RUN publish-zkeacms

# Copy Database
RUN mkdir /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/App_Data
RUN cp -f /build/DataBase/SQLite/Database.sqlite /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/App_Data/Database.sqlite
RUN cp -f /build/DataBase/SQLite/appsettings.json /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput/appsettings.json

# Build runtime image
FROM microsoft/dotnet:2.2.0-aspnetcore-runtime
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
