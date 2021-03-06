<# 15.09.2021 (c) Schnittlauch Version 1.0
Thanks to the official MS documentation
You can use this script in case of having trouble with your Exchange.

For this script you need:
-The Exchange Management Shell 

An optional checklist:
[] All Services that have been up, are still up?
[] All Server componentstates are active?
[] ECP/OWA reachable
[] Possible to send mails?
[] IIS okay?
[] Suspicious tasks in taskmanager?
[] Any monitoring alerts?
[] Eventviewer provides more information?
#>


#Record Services before
get-service | select name, starttype, status | export-csv C:\Users\$env:UserName\Desktop\Powershell\Services\servicesbefore.csv -Delimiter ';'

#Record Services after
get-service | select name, starttype, status | export-csv C:\Users\$env:UserName\Desktop\Powershell\Services\servicesafter.csv -Delimiter ';'

#Compare
Compare-Object (Get-Content "C:\Users\$env:UserName\Desktop\Powershell\Services\servicesbefore.csv") (Get-Content "C:\Users\$env:UserName\Desktop\Powershell\Services\servicesafter.csv")

#Note: You will see each services twice. The upper services are the initial records, while the lower ones is the new record.

#Exchange specific // Start all MS Exchange services
foreach ($service in (Get-Service) -eq "*Microsoft Exchange*")
{
    Set-Service $service -StartupType Automatic
    Start-Service $service
}

#Get ServerComponentState
Get-ServerComponentState -Identity $env:COMPUTERNAME | Where-Object State -eq "inactive"

#Start all ServerComponentState
$SCP = Get-ServerComponentState.Component
foreach ($CP in $SCP)
{
Set-ServerComponentState -Identity $env:COMPUTERNAME -Component $CP -Requester maintenance -State Active
}

write-host "I'm done so far. Maybe checkout the healthchecker script
https://microsoft.github.io/CSS-Exchange/Diagnostics/HealthChecker/"

#That's it so far. // I will keep adding some lines.
