FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /build

# Copy all files
COPY . ./

# Release ZKEACMS.WebHost
WORKDIR /build/src/ZKEACMS.WebHost
RUN dotnet publish-zkeacms

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
