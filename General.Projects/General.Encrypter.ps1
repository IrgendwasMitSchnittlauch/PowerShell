###################################################
# General.encrypter.ps1                           #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 04th december 2021                              #
###################################################

#Flo's PowerShell Encrypter
#path and filename of the encrypted Text
$file = "C:\users\$env:USERNAME\desktop\TopSecret.txt.secret"

#Enter the Text here:
$string = "Noone will understand in the first moment, what we are talking about"

#Would never recommend a key lower than 25
$key = 15853
$key2 = 15853
#Should be lower than key 1 & 2
$key3 = 15

#Check if file exists
####
if ((Test-Path -Path $file -PathType Leaf) -eq $false)
{
write-host "The file does not exist. Please enter a valid path" -BackgroundColor red -ForegroundColor black
}
elseif ((Test-Path -Path $file -PathType Leaf) -eq $true) 
{
Write-Host "The file does exist. I'll try to start the encryption" -BackgroundColor green -ForegroundColor black; start-sleep 1


####################
#Defaults
$length = $string.Length
$count1 = 0
$count2 = 0
$slength = 0
$string = $string.ToLower()

#Maybe this while loop is not needed :D
while(($slength) -ne $length)
{
foreach ($char in $string)
{
#Make each char standalone
$char = $string.substring($count2,1)

#switch value
switch($char){
"a" {$charvalue = 1}
"b" {$charvalue = 2}
"c" {$charvalue = 3}
"d" {$charvalue = 4}
"e" {$charvalue = 5}
"f" {$charvalue = 6}
"g" {$charvalue = 7}
"h" {$charvalue = 8}
"i" {$charvalue = 9}
"j" {$charvalue = 10}
"k" {$charvalue = 11}
"l" {$charvalue = 12}
"m" {$charvalue = 13}
"n" {$charvalue = 14}
"o" {$charvalue = 15}
"p" {$charvalue = 16}
"q" {$charvalue = 17}
"r" {$charvalue = 18}
"s" {$charvalue = 19}
"t" {$charvalue = 20}
"u" {$charvalue = 21}
"v" {$charvalue = 22}
"w" {$charvalue = 23}
"x" {$charvalue = 24}
"y" {$charvalue = 25}
"z" {$charvalue = 26}
1 {$charvalue = 27}
2 {$charvalue = 28}
3 {$charvalue = 29}
4 {$charvalue = 30}
5 {$charvalue = 31}
6 {$charvalue = 32}
7 {$charvalue = 33}
8 {$charvalue = 34}
9 {$charvalue = 35}
0 {$charvalue = 36}
"." {$charvalue = 37}
" "{$charvalue = 38}
"!"{$charvalue = 39}
"?"{$charvalue = 40}
"."{$charvalue = 41}
","{$charvalue = 42}
"-"{$charvalue = 43}
"_"{$charvalue = 44}
":"{$charvalue = 45}
"/"{$charvalue = 46}


default {$charvalue = $char}
}
#encrypt it:
if ($charvalue -is [int]){
$charvalue = $charvalue * $Key +$key2 -$key3}

$charvalue | out-file "$file" -append -NoNewline
";" | out-file "$file" -append -NoNewline


#count
$count2++
$slength++
}}
"
<END>" | out-file "$file" -append
write-host "the file is located here: $file"-BackgroundColor Yellow -ForegroundColor black
}
