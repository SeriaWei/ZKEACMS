@echo off
@echo -----------------------------------------------------------------------------
@echo *** ��ӭʹ�� ZKEACMS ***
@echo -----------------------------------------------------------------------------
@echo �ù��߽��������������� ZKEACMS ����
@echo �ڿ�ʼ֮ǰ�����Ȳ鿴���ǵ����Э��
@echo http://www.zkea.net/licenses
@echo -----------------------------------------------------------------------------
@echo ������������
@echo http://www.zkea.net/zkeacms/document/deploy/core
@echo -----------------------------------------------------------------------------
@echo ע�⣺����ʱ����շ���Ŀ¼
WHERE /Q dotnet
IF %ERRORLEVEL% NEQ 0 (
ECHO dotnet core sdk was not find, please install the latest sdk at first.
@pause
start https://www.microsoft.com/net/download/windows
exit
)

set /P i=�Ƿ��������ʱ����?(y/n)
if not "%i%"=="y" goto start
@echo ��ϸ������ʱRID�����
@echo https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
@echo ��������ʱRID: win-x64,linux-x64
set /P r=��������ʱ RID:
:start
@echo ���ڷ��������Ժ�...
dotnet restore
cd src/ZKEACMS.WebHost
if not "%i%"=="y" (
    dotnet publish-zkeacms
)
if "%i%"=="y" (
    dotnet publish-zkeacms %r%
)

explorer %cd%\bin\Release\PublishOutput