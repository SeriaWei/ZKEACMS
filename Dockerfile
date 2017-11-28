FROM microsoft/aspnetcore:2.0
ARG source
WORKDIR /zkeacms
RUN /Publish.sh
EXPOSE 80
COPY ${source:-src/ZKEACMS.WebHost/bin/Release/PublishOutput} .
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
