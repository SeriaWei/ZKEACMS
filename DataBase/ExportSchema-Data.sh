#!/bin/sh
mssql-scripter -S localhost -d ZKEACMS_Core -U sa -P sa --target-server-version 2008 --schema-and-data --exclude-headers > ./script.sql