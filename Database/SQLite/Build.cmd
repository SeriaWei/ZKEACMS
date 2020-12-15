@echo off
@echo Creating Sqlite Database
dotnet tool restore
dotnet tool run sqlite-exec -d Database.sqlite -f ZKEACMS.sqlite.sql