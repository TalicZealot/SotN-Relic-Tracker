#Download and move files
$shell_app=new-object -com shell.application

mkdir NewVersion

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Download SotN-Relic-Tracker
$url = "https://github.com/TalicZealot/SotN-Relic-Tracker/archive/master.zip"
$filename = "master.zip"
Invoke-WebRequest -Uri $url -OutFile $filename
#Unzip
$zip_file = $shell_app.namespace((Get-Location).Path + "\$filename")
$destination = $shell_app.namespace((Get-Location).Path + "\NewVersion")
$destination.Copyhere($zip_file.items())
Remove-Item $filename

#Update files
Remove-Item .\Presets  -Recurse
Remove-Item .\images  -Recurse
Remove-Item .\*.lua  -Recurse
Remove-Item .\*.md  -Recurse
Move-Item -Force -Path .\NewVersion\SotN-Relic-Tracker-master\* -Destination .
Remove-Item .\NewVersion -Recurse