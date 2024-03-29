﻿<#
28.06.2021 (c) Schnittlauch Version 1.1
Thanks to the official MS documentation

For this script you need:

-A CSV file with the Columns of your DisplayName, UserPrincipalName, Password, MailNickName
-The Azure Module


NOTE: THERE IS A NEWER SCRIPT WITH LICENSING AND ADDING TO GROUPS AVAILABLE:
Github/IrgendwasMitSchnittlauch/powershell/Azure.CreateMassUserWithLicense.ps1
https://github.com/IrgendwasMitSchnittlauch/Powershell/blob/main/Azure.CreateMassUserWithLicense.ps1


-----

How to install the Azure PS Module:

https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.1.0

-----
make sure that 

Get-ExecutionPolicy -list

CurrentUser and LocalMachine is set to "unrestricted".
#>


$import = Import-Csv C:\Users\Schnittlauch\Desktop\Azure.csv -Delimiter ';'

foreach ($item in $import) 
{$secure = ConvertTo-SecureString -string $item.Password -AsPlainText -force; 
New-AzADUser -DisplayName $item.DisplayName -UserPrincipalName $item.UserPrincipalName -Password $secure -MailNickname $item.MailNickName}

#That was it. lol
#Pay attention that you don't put any words from your users name into the password. Otherwise Azure won't create the user.
