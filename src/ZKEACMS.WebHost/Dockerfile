FROM mcr.microsoft.com/dotnet/aspnet:5.0
ARG source
WORKDIR /zkeacms
EXPOSE 80
COPY ${source:-bin/Release/PublishOutput} .
RUN apt update -y
RUN apt install libicu-dev libgdiplus -y
ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
