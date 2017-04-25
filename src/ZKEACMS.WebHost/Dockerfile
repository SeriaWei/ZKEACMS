FROM microsoft/aspnetcore:1.1
ARG source
WORKDIR /zkeacms
EXPOSE 80
COPY ${source:-bin/Release/PublishOutput} .
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
