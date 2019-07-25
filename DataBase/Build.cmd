@echo off
cd /d %~dp0
REM:If garbled when running, the following link can help to resolve:
REM:http://www.zkea.net/zkeacms/document/issues
WHERE /Q sqlcmd
IF %ERRORLEVEL% NEQ 0 (
echo sqlcmd Utility is required, please install the tool before you run the command
@pause
start https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility
exit
)
@echo *****************************************
@echo ******** Welcome to use ZKEACMS *********
@echo *****************************************
@echo Documents
@echo http://www.zkea.net/zkeacms/document
@echo -----------------------------------------------------------------------------
@echo Will create the ZKEACMS database
@echo If you want to upgrade your existing database, execute the scripts under "Update" folder
@echo -----------------------------------------------------------------------------
@echo Press Enter to use the default setting
@echo Working directory:%cd%
set /P server=1.Sql Server address (local):
if "%server%"=="" set server=(local)
set /P dataBase=2.Database name (ZKEACMS):
if "%dataBase%"=="" set dataBase=ZKEACMS
set /P dbUserId=3.User name (sa):
if "%dbUserId%"=="" set dbUserId=sa
set /P dbPassword=4.Password (sa):
if "%dbPassword%"=="" set dbPassword=sa

@echo Please wait...
@echo Creating DataBase %dataBase%
sqlcmd -x -S %server% -d master -U %dbUserId% -P %dbPassword% -b -Q "DROP DATABASE IF EXISTS [%dataBase%]"
sqlcmd -x -S %server% -d master -U %dbUserId% -P %dbPassword% -b -Q "CREATE DATABASE [%dataBase%]"

sqlcmd -x -S %server% -d %dataBase% -U %dbUserId% -P %dbPassword% -b -i "script.sql"
if %ERRORLEVEL% NEQ 0 goto errors

sqlcmd -x -S %server% -d master -U %dbUserId% -P %dbPassword% -b -Q "ALTER DATABASE [%dataBase%] SET READ_WRITE"

@echo -----------------------------------------------------------------------------
@echo 数据库创建成功。
goto done

:errors
@echo -----------------------------------------------------------------------------
@echo 警告，在数据库创建过程中，出现了错误。请重新检查您的配置信息并重试。
goto done
:done
@pause