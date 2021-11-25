###################################################
# stupid.get-alcohol.ps1                          #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 25th november 2021                              #
###################################################

$AsciBeer ="
CHEERS!
                                                                       
                                                                                        
    ██████████████  ██           
  ██              ██  ██         
██                    ██         
██              ████    ████     
██      ████████░░░░████    ██   
██    ██░░░░░░░░░░░░██▒▒▒▒▒▒  ██ 
  ████░░░░░░░░░░░░░░██▒▒██▒▒  ██ 
  ██░░░░░░░░░░░░░░░░████  ██  ██ 
  ██░░░░░░░░░░░░░░░░██    ██  ██ 
  ██░░░░░░░░░░░░░░░░██    ██  ██ 
  ██░░░░░░░░░░░░░░░░██    ██  ██ 
  ██░░░░░░░░░░░░░░░░████  ██  ██ 
  ██░░░░░░░░░░░░░░░░██  ██▒▒  ██ 
  ██░░░░░░░░░░░░░░░░██  ▒▒▒▒██   
  ██░░░░░░░░░░░░░░░░██▒▒▒▒██     
  ██░░░░░░░░░░░░░░░░██████       
██  ██░░░░░░░░░░░░░░██           
██  ▒▒██████████████▒▒██         
  ██  ▒▒▒▒        ▒▒  ██         
    ████          ████           
        ██████████            


Press 'Enter' to get-alcohol
"
$AsciDrink ="

CHEERS!

      ▒▒▒▒▒▒▒▒▒▒▒▒       
  ▒▒▒▒            ▒▒▒▒   
▒▒                    ▒▒ 
▒▒▒▒▒▒            ▒▒▒▒▒▒ 
▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒ 
▒▒                    ▒▒ 
▒▒                    ▒▒ 
▒▒    ▓▓▒▒▓▓▓▓▒▒▓▓    ▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ 
▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒   
    ▒▒▒▒▒▒▒▒▒▒▒▒       


Press 'Enter' to get-alcohol
"

$AsciShot ="

CHEERS!

██████████████████ 
██            ░░██ 
██      ░░      ██ 
██      ░░░░  ░░██ 
██▒▒▒▒▒▒▒▒░░▒▒▒▒██ 
██▓▓▓▓▓▓▓▓▓▓▓▓▓▓██ 
██▓▓▓▓▓▓▓▓▓▓▓▓▓▓██ 
  ██████▓▓▓▓██▓▓   
   ▓▓▓▓▓▓▓▓▓▓▓▓       


Press 'Enter' to get-alcohol
"

$GrußformelBier = "My todays recommendation is"
$GrußformelMische = "I would recommend a mixture of"
$GrußformelShot = "Let's shot"
function Get-Alcohol {
    Clear-Host
    $glass = Get-Random -Minimum 1 -Maximum 4
        switch ($glass) {
            1 {$Brauerei = Get-Random -Minimum 1 -Maximum 8 
            switch ($brauerei) {
                1 {$Brauerei_GO = Get-Random -Minimum 1 -Maximum 5
                    $BrauereiName = "Brauerei Gold Ochsen's:"
                switch ($Brauerei_GO) {
                    1 {Write-host $GrußformelBier $BrauereiName "Gold Ochsen Orginal"}
                    2 {Write-host $GrußformelBier $BrauereiName "Gold Ochsen Helles"}
                    3 {Write-host $GrußformelBier $BrauereiName "Weihnachtsbier"}
                    4 {Write-host $GrußformelBier $BrauereiName "Kellerbier"}
                }}
                
                2 {$Brauerei_AG = Get-Random -Minimum 1 -Maximum 3
                    $BrauereiName = "Augustiner Brauerei's:"
                switch ($Brauerei_AG) {
                    1 {Write-host $GrußformelBier $BrauereiName "Augustiner Edelstoff"}
                    2 {Write-host $GrußformelBier $BrauereiName "Augustiner Bräu München Lagerbier Hell"}}}
                
                3 {$Brauerei_KS = Get-Random -Minimum 1 -Maximum 2
                    $BrauereiName = "Kaiser Brauerei's:"
                switch ($Brauerei_KS) {
                    1 {Write-host $GrußformelBier $BrauereiName "Kaiser Export 1881"}}}
                
                4 {$Brauerei_PL = Get-Random -Minimum 1 -Maximum 2
                    $BrauereiName = "Pflugbrauerei Hörvelsingen's:"
                switch ($Brauerei_PL) {
                    1 {Write-host $GrußformelBier $BrauereiName "PFLUG Bockbier Naturtrüb"}}}

                5 {$Brauerei_NT = Get-Random -Minimum 1 -Maximum 3
                    $BrauereiName = "Nattheimer Brauerei's:"
                switch ($Brauerei_NT) {
                    1 {Write-host $GrußformelBier $BrauereiName "Nattheimer Spezial"}
                    2 {Write-host $GrußformelBier $BrauereiName "Nattheimer Festbier"}}}

                6 {$Brauerei_BT = Get-Random -Minimum 1 -Maximum 3
                    $BrauereiName = "Bräustüberl Tegernsee:"
                switch ($Brauerei_BT) {
                    1 {Write-host $GrußformelBier $BrauereiName "Tegernseer Spezial"}
                    2 {Write-host $GrußformelBier $BrauereiName "Tegernseer Dunkel Export Naturtrüb"}}}

                7 {$Brauerei_BB = Get-Random -Minimum 1 -Maximum 2
                    $BrauereiName = "Berg Brauerei's:"
                switch ($Brauerei_BB) {
                    1 {Write-host $GrußformelBier $BrauereiName "Berg Ulrichsbier"}}}
                }
                write-host $AsciBeer
            }
            
            2 {$Mische1 = Get-Random -minimum 1 -Maximum 9; $Mische2 = Get-Random -minimum 1 -Maximum 9
                switch ($Mische1) {
                    1 {$Mische1 = "Vodka"}
                    2 {$Mische1 = "Rum"}
                    3 {$Mische1 = "Whiskey"}
                    4 {$Mische1 = "Bacardi"}
                    5 {$Mische1 = "Amaretto"}
                    6 {$Mische1 = "Jacky"}
                    7 {$Mische1 = "Gin"}
                    8 {$Mische1 = "Jägermeister"}
                }
                switch ($mische2) {
                    1 {$Mische2 = "Red Bull"}
                    2 {$Mische2 = "Cola"}
                    3 {$Mische2 = "Orange"}
                    4 {$Mische2 = "Sprite"}
                    5 {$Mische2 = "Fanta"}
                    6 {$Mische2 = "Tonic"}
                    7 {$Mische2 = "Beer"}
                    8 {$Mische2 = $Mische1}}
            Write-host "$GrußformelMische $Mische1 and $Mische2" $AsciDrink
            }
            3   {$Shots = Get-Random -minimum 1 -Maximum 8
                $times = Get-Random -minimum 1 -Maximum 4
                    switch ($Shots) {
                        1 {$Shot = "Tequilla"}
                        2 {$Shot = "Saurer Joster"}
                        3 {$Shot = "Berliner Luft"}
                        4 {$Shot = "Pfeffi"}
                        5 {$Shot = "Selbstgebrantes"}
                        6 {$Shot = "Obstler"}
                        7 {$Shot = "Prinz Obstbrände"}}
                    write-host "$GrußformelShot $Shot $times times $AsciShot"
                    }
        }
        $enter = Read-Host
        Get-Alcohol
    }

Get-Alcohol


<#
Biere:
Brauerei Gold Ochsen1/4
	Orginal
	Helles
	Keller
	Weihnachtsbier
Augustiner 2
	Edelstoff
Kaiser3
	Weihnachtsbier
Pflug4
	Bockbier
Nattheimer5
	Spezial
Bräustüberl Tegernsee6
	Hell
	Spezial
	Export Naturtrüb
Berg Brauerei7
	Weihnachtsbier
	Ulrichsbier


Mischen:
Vodka
Rum
Whiskey
Bacardi
Amaretto

Energy
Cola
Orange
Sprite
Fanta

Shots:

Tequilla
Ficken
Saurer Joster
Berliner Luft
Pfeffi
#>
