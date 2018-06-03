Add-Type -assembly "system.io.compression.filesystem"
$source = "Release"
$destination = "ZKEACMS.Core.v3.0.zip"
Write-Host "Starting release" $destination
Write-Host "This may take a few minutes, please wait..."
if(!(Get-Command dotnet -ErrorAction SilentlyContinue))
{
    Write-Host "Installing .Net Core SDK..."
   ./dotnet-install.ps1 -Channel Current -Version latest
}
if(Test-Path $source){
    Remove-Item -Path $source -Force -Recurse
}
if(Test-path $destination) {    
    Remove-item -Path $destination -Force -Recurse
}
Invoke-Expression("dotnet restore")
Set-Location src/ZKEACMS.WebHost
Invoke-Expression("publish-zkeacms")
Set-Location ../../
Write-Host "Copy files..."
Copy-Item -Path "src/ZKEACMS.WebHost/bin/Release/PublishOutput" -Destination "Release/Application" -Force -Recurse
$dbSource = 'DataBase'
$dbDestination = 'Release/Database'
$exclude = @('*.mdf','*.ldf')
$length =(Get-Item -Path ".\" -Verbose).FullName.Length + $dbSource.Length + 1
Get-ChildItem $dbSource -Recurse -Exclude $exclude | Copy-Item -Destination {Join-Path $dbDestination $_.FullName.Substring($length)}
Write-Host "Archive to" $destination
[io.compression.zipfile]::CreateFromDirectory($Source, $destination)