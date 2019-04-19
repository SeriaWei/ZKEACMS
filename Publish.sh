echo Publish starting, this may take a few minutes...
dotnet restore
dotnet tool install -g ZKEACMS.Publisher
cd src/ZKEACMS.WebHost
export PATH="$PATH:/root/.dotnet/tools"
publish-zkeacms