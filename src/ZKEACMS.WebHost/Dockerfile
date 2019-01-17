FROM microsoft/aspnetcore:2.2
ARG source
WORKDIR /zkeacms
EXPOSE 80
COPY ${source:-bin/Release/PublishOutput} .
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
