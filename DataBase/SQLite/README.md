# Create SQLite Database
You should install [sqlite-exec](https://www.nuget.org/packages/sqlite-exec/) tool at first：
```
dotnet tool install --global sqlite-exec
```
Then use `ZKEACMS.sqlite.sql` script to create the datebase:
```
sqlite-exec -d Database.sqlite -f ZKEACMS.sqlite.sql
```
`Database.sqlite` will be created in working directory.