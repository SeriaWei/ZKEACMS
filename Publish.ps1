if(!(Get-Command dotnet -ErrorAction SilentlyContinue))
{
    Write-Host "正在安装 .Net Core SDK，请稍后..."
   ./dotnet-install.ps1 -Channel Current -Version latest
}
Write-Host "-----------------------------------------------------------------------------"
Write-Host "*** 欢迎使用 ZKEACMS ***"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "该工具将帮助您发布您的 ZKEACMS 程序"
Write-Host "在开始之前请您先查看我们的许可协议"
Write-Host "http://www.zkea.net/licenses"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "部署相关请访问"
Write-Host "http://www.zkea.net/zkeacms/document/deploy/core"
Write-Host "-----------------------------------------------------------------------------"
Write-Host "注意：发布时会清空发布目录"
Set-Location src/ZKEACMS.WebHost
$withRuntime = Read-Host -Prompt "是否包含运行时发布?(y/n)"
if($withRuntime.ToUpper() -eq "Y")
{
    Write-Host "详细的运行时RID请访问"
    Write-Host "https://docs.microsoft.com/en-us/dotnet/core/rid-catalog"
    Write-Host "常用运行时RID"
    Write-Host "win7-x64,win10-x64,ubuntu.16.04-x64,centos.7-x64,osx.10.12-x64"
    $rid = Read-Host -Prompt "请输入RID"     
    Invoke-Expression("dotnet publish-zkeacms " + $rid)
}
else{
        Invoke-Expression("dotnet publish-zkeacms")
}
Write-Host "发布成功，正在运行程序"
Set-Location bin/Release/PublishOutput
Invoke-Expression("dotnet ZKEACMS.WebHost.dll")