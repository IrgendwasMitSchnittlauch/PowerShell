<# 15.09.2021 (c) Schnittlauch Version 1.0
Thanks to the official MS documentation
You can use this script to get a LSD trip, I DO NOT RECOMMEND TO USE IT

Also thanks to gituser user B4Art
https://gist.github.com/timabell/cc9ca76964b59b2a54e91bda3665499e

For this script you need:
-PowerShell #>

while (1 -ne 2){
    Foreach ($bgcolor in $colors){
        Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
        Write-Host " on $bgcolor"
        }
    }