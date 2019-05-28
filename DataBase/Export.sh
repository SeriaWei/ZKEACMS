#!/bin/sh
server='localhost'
database='ZKEACMS'
username='sa'
password='sa'

echo echo Generate mysql dump.sql
cd MySql
mssql2mysql -s $database -c "Server=$server;Database=$database;User Id=$username;Password=$password;MultipleActiveResultSets=true;"
cd ..

echo Generate Schema
mssql-scripter -S $server -d $database -U $username -P $password --target-server-version 2008 --exclude-use-database --exclude-headers --file-per-object --include-objects dbo. --file-path ./Tables

echo Generate Data
mssql-scripter -S $server -d $database -U $username -P $password --target-server-version 2008 --exclude-use-database --exclude-headers --file-per-object --data-only --include-objects dbo. --file-path ./InitialData
cd InitialData
dotnet AppendGo.dll
cd ..
echo Combine to script.sql
mssql-scripter -S $server -d $database -U $username -P $password --target-server-version 2008 --schema-and-data --exclude-headers > ./script.sql
