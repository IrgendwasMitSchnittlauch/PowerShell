#For this script you need:
#A CSV file with your servers to snapshot (To access to each colum use fe. $ImportedCsv.ColumXY)
#The PowerCli Module
#-------

#Install the PowerCLI Module
Install-Module -Name VMware.PowerCLI -Scope CurrentUser

#-------

#If you have trouble try this:
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Powershell is complaining about an untrusted repository? Use this:
Register-PSRepository -Default -Verbose
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

#-------

#Importing the CSV File
$ImportedCSV = Import-CSV -path C:\Users\Schnittlauch\Desktop\ServersToPatch.CSV

#Define how long your script should wait for the next snapshot
$TimeInSeconds = 20

#Connect to your VMware vCenter
Connect-VIServer -Server ThisIsTheNameOfYour.vCenter.local

#Give your Snapshots a name
$SnapshotName = "Snapshot from the 05.05.2021"
echo $SnapshotName

#Start with the real Snapshot creation
foreach ($Server in $ImportedCSV.Server)
{
New-Snapshot -vm $Server -Name $SnapshotName; Start-Sleep -Seconds $TimeInSeconds
}
$Echo1 = "Snapshots named " + $SnapshotName + " have been created"
echo $Echo1

#-------

#Here is a small Calculator how long it will take untill all of your Snapshots are finished
echo "Your Snapshots will take about " ((($ImportedCSV.count * $TimeInSeconds)+10) /60) " Minutes"

#New-TimeSpan Calculation
$CalculatedSeconds = (($ImportedCSV.count * $TimeInSeconds)+10)
$ts = New-TimeSpan -seconds $CalculatedSeconds
echo "You will be ready at "
(Get-Date)+$ts

#-------

#If you want to delete your snapshots:
Get-VM $ImportedCSV | Get-Snapshot -name $SnapshotName | Remove-Snapshot -Confirm:$False
$EchoEnd = "Snapshots with the name " + $SnapshotName + " have been delted."
echo $EchoEnd
