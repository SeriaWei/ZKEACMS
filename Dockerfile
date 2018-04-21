FROM microsoft/aspnetcore-build:latest AS builder
WORKDIR /build
# Copy all files
COPY . ./
RUN dotnet restore
# Release ZKEACMS.WebHost
WORKDIR /build/src/ZKEACMS.WebHost
RUN dotnet publish-zkeacms

# Build runtime image
FROM microsoft/aspnetcore:latest
WORKDIR /zkeacms
COPY --from=builder /build/src/ZKEACMS.WebHost/bin/Release/PublishOutput .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
