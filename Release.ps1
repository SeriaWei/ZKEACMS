Add-Type -assembly "system.io.compression.filesystem"
$source = "Release"
$destination = "ZKEACMS.zip"
Write-Host "Starting release" $destination
Write-Host "This may take a few minutes, please wait..."
if(Test-Path $source){
    Remove-Item -Path $source -Force -Recurse
}
if(Test-path $destination) {    
    Remove-item -Path $destination -Force -Recurse
}
Invoke-Expression("dotnet restore")
Set-Location src/ZKEACMS.WebHost
Invoke-Expression("dotnet tool restore")
Invoke-Expression("dotnet tool run publish-zkeacms")
Set-Location ../../
Write-Host "Copy files..."
New-Item -Path "." -Name "Release" -ItemType "directory" -Force
Move-Item -Path "src/ZKEACMS.WebHost/bin/Release/PublishOutput" -Destination "Release/Application"
New-Item -Path "Release/Application" -Name "App_Data" -ItemType "directory"
Invoke-Expression("sqlite-exec -d Release/Application/App_Data/Database.sqlite -f Database/SQLite/ZKEACMS.sqlite.sql")
Copy-Item -Path "Database/SQLite/appsettings.json" -Destination "Release/Application/appsettings.json" -Force
$dbSource = 'Database'
$dbDestination = 'Release/Database'
$exclude = @('*.mdf','*.ldf','*.cmd','*.exe','*.dll','*.sh','*.json')
$length =(Get-Item -Path ".\" -Verbose).FullName.Length + $dbSource.Length + 1
Get-ChildItem $dbSource -Recurse -Exclude $exclude | Copy-Item -Destination {Join-Path $dbDestination $_.FullName.Substring($length)}
Write-Host "Archive to" $destination
[io.compression.zipfile]::CreateFromDirectory($Source, $destination)