<# 29.06.2021 (c) Schnittlauch Version 2.0

Thanks to the official MS documentation

With this Script you can create Azure AD Users with an E-Mail, License them and add them into Group-Mailboxes

For this script you need:
-A CSV file with the Columns of your DisplayName, UserPrincipalName, Password, MailNickName, Location, LicenseYN (License Yes No), (in my example the group is called:) SupportGruppeYN
-In best case all Azure Modules

-----
How to install the Azure PS Module:
https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.1.0
-----

make sure that 
Get-ExecutionPolicy -list
CurrentUser and LocalMachine is set to "unrestricted".

Don't forget to download the Azure AD Module:
Install-Module -Name AzureAD

https://docs.microsoft.com/en-us/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell?view=o365-worldwide
#>

$Import = import-csv 'C:\Users\Florian\Desktop\Azure.csv' -Delimiter ';'

#Connecting 
Connect-AzureAD
Connect-ExchangeOnline
Connect-AzAccount

#If you want to sign a license you have to do this manually:

#Find out the name of your Subscription
Get-AzureADSubscribedSku | Select SkuPartNumber

#Don't forget to set the variable here: (!!!)
$planName = "O365_BUSINESS_ESSENTIALS"

#Define the Group, to which the user should get added eg. "support" | Attention that's not a mailing list, its a seperate Mailbox
$Group = "Support"


foreach ($item in $import) 
{$secure = ConvertTo-SecureString -string $item.Password -AsPlainText -force; 
New-AzADUser -DisplayName $item.DisplayName -UserPrincipalName $item.UserPrincipalName -Password $secure -MailNickname $item.MailNickName; 
if ($item.LicenseYN -eq "y")
{
$userUPN = $item.UserPrincipalName
$userLocation = $item.Location
Set-AzureADUser -ObjectId $userUPN -UsageLocation $userLocation


$License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$License.SkuId = (Get-AzureADSubscribedSku | Where-Object -Property SkuPartNumber -Value $planName -EQ).SkuID
$LicensesToAssign = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$LicensesToAssign.AddLicenses = $License
Set-AzureADUserLicense -ObjectId $userUPN -AssignedLicenses $LicensesToAssign
Write-host "for the user" $item.DisplayName "a License was assinged"
}
else {write-host "for the user" $item.DisplayName "no License was requested"}

if ($item.SupportGruppeYN -eq "y"){Add-AzADGroupMember -TargetGroupDisplayName $Group -MemberUserPrincipalName "$item.UserPrincipalName";
Write-Host "The user" $item.UserPrincipalName "GETS" $Group "Group permissions."}
else{Write-Host "The user" $item.UserPrincipalName "gets NO" $Group "Group permissions."}
}



<# If anyone cares here is how it should look like if you make your import:


displayname       : John Doe
Password          : JohnsPassword123!
UserPrincipalName : J.Doe@schaffamuasch.onmicrosoft.com
MailNickname      : John Doe
Location          : DE
LicenseYN         : y
SupportGruppeYN   : n

#>
