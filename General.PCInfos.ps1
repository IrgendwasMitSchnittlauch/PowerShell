clear-host

$username = Get-CimInstance -ClassName Win32_ComputerSystem | select username
$username = $username.username
$ADGroup = Get-CimInstance -ClassName Win32_ComputerSystem | select domain
$ADGroup = $AdGroup.domain
$ProcessArchitecture = Get-CimInstance -ClassName Win32_ComputerSystem | Select SystemType
$ProcessArchitecture = $ProcessArchitecture.SystemType
$Manufacturer = Get-CimInstance -ClassName Win32_ComputerSystem | Select Manufacturer
$Manufacturer = $Manufacturer.Manufacturer
$Model = Get-CimInstance -ClassName Win32_ComputerSystem | Select Model
$Model = $Model.Model
$Version = Get-CimInstance -ClassName Win32_QuickFixEngineering | select Description,HotFixID

clear-host
write-host "This is your hostname\username:
$username

"

write-host "This is your AD-Group:
$AdGroup

"

write-host "This is your architecture type:
$ProcessArchitecture

"

write-host "This is your Manufacturer:
$Manufacturer

"

write-host "This is your Model:
$Model

"

Write-host "Down here are listed the latest KB Updates:"
$Version