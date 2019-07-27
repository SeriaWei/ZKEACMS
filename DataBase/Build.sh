#!/bin/sh

server='localhost'
dataBase='ZKEACMS'
dbUserId='sa'
dbPassword='sa'

echo Creating DataBase $dataBase
sqlcmd -x -S $server -d master -U $dbUserId -P $dbPassword -b -Q "DROP DATABASE IF EXISTS [$dataBase]"
sqlcmd -x -S $server -d master -U $dbUserId -P $dbPassword -b -Q "CREATE DATABASE [$dataBase]"

echo Creating Tables...
echo CMS_Layout
sqlcmd -x -S $server -d $dataBase -U $dbUserId -P $dbPassword -b -i script.sql

sqlcmd -x -S $server -d master -U $dbUserId -P $dbPassword -b -Q "ALTER DATABASE [$dataBase] SET READ_WRITE"


