if(!(Get-Command dotnet -ErrorAction SilentlyContinue))
{
    Write-Host "���ڰ�װ .Net Core SDK�����Ժ�..."
   ./dotnet-install.ps1 -Channel Current -Version latest
}
Write-Host "-----------------------------------------------------------------------------"
Write-Host "*** ��ӭʹ�� ZKEACMS ***"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "�ù��߽��������������� ZKEACMS ����"
Write-Host "�ڿ�ʼ֮ǰ�����Ȳ鿴���ǵ����Э��"
Write-Host "http://www.zkea.net/licenses"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "������������"
Write-Host "http://www.zkea.net/zkeacms/document/deploy/core"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "ע�⣺����ʱ����շ���Ŀ¼"
Set-Location src/ZKEACMS.WebHost
$withRuntime = Read-Host -Prompt "�Ƿ��������ʱ����?(y/n)"
if($withRuntime.ToUpper() -eq "Y")
{
    Write-Host "��ϸ������ʱRID�����"
    Write-Host "https://docs.microsoft.com/en-us/dotnet/core/rid-catalog"
    Write-Host "��������ʱRID"
    Write-Host "win7-x64,win10-x64,ubuntu.16.04-x64,centos.7-x64,osx.10.12-x64"
    $rid = Read-Host -Prompt "������RID" 
	Invoke-Expression("dotnet restore")
    Invoke-Expression("dotnet publish-zkeacms " + $rid)
}
else{
		Invoke-Expression("dotnet restore")
        Invoke-Expression("dotnet publish-zkeacms")
}
Write-Host "�����ɹ����������г���"
Set-Location bin/Release/PublishOutput
Invoke-Expression("dotnet ZKEACMS.WebHost.dll")