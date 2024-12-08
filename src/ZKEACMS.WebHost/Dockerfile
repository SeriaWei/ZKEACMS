FROM mcr.microsoft.com/dotnet/aspnet:8.0
ARG source
WORKDIR /zkeacms
COPY ${source:-bin/Release/PublishOutput} .
EXPOSE 8080
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
