###################################################
# stupid.decrypter.ps1                            #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 04th december 2021                              #
###################################################

#Flo's PowerShell Decrypter
$file = "C:\users\$env:USERNAME\desktop\TopSecret.txt.Secret"

#Enter your Keys
[int]$key = 15853
[int]$key2 = 15853
#Should be lower than key 1 & 2
[int]$key3 = 15

#Check if file exists
####
if ((Test-Path -Path $file -PathType Leaf) -eq $false)
{
write-host "The file does not exist. Please enter a valid path" -BackgroundColor red -ForegroundColor black
}
elseif ((Test-Path -Path $file -PathType Leaf) -eq $true) 
{
Write-Host "The file does exist." -BackgroundColor green -ForegroundColor black ; Start-sleep 0

####################
$message= ""
$Cryptedtext = Get-Content $file
$Cryptedtext = $Cryptedtext -replace "<END>"," "

$Cryptedtextarray = $Cryptedtext -split ";"

foreach ($number in $Cryptedtextarray)
{
<#
[int]$number ;write-host $number
$numberchar = ([int]$number+[int]$key3) ;write-host $numberchar
$numberchar = ([int]$numberchar-[int]$key2) ;write-host $numberchar
$numberchar = ([int]$numberchar/[int]$key)  ;write-host $numberchar}
#>
$numberchar = ((([int]$number+[int]$key3)-[int]$key2)/[int]$key)
switch ($numberchar){
1 {$message = $message+"a"}
2 {$message = $message+"b"}
3 {$message = $message+"c"}
4 {$message = $message+"d"}
5 {$message = $message+"e"}
6 {$message = $message+"f"}
7 {$message = $message+"g"}
8 {$message = $message+"h"}
9 {$message = $message+"i"}
10{$message = $message+"j"}
11{$message = $message+"k"}
12{$message = $message+"l"}
13{$message = $message+"m"}
14{$message = $message+"n"}
15{$message = $message+"o"}
16{$message = $message+"p"}
17{$message = $message+"q"}
18{$message = $message+"r"}
19{$message = $message+"s"}
20{$message = $message+"t"}
21{$message = $message+"u"}
22{$message = $message+"v"}
23{$message = $message+"w"}
24{$message = $message+"x"}
25{$message = $message+"y"}
26{$message = $message+"z"}
27{$message = $message+1 }
28{$message = $message+2 }
29{$message = $message+3 }
30{$message = $message+4 }
31{$message = $message+5 }
32{$message = $message+6 }
33{$message = $message+7 }
34{$message = $message+8 }
35{$message = $message+9 }
36{$message = $message+0 }
37{$message = $message+"."}
38{$message = $message+" "}
39{$message = $message+"!"}
40{$message = $message+"?"}
41{$message = $message+"."}
42{$message = $message+","}
43{$message = $message+"-"}
44{$message = $message+"_"}
45{$message = $message+":"}
46{$message = $message+"/"}
}}}
clear-host

write-host "This is the message:"
write-host $message
