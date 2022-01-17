###################################################
# overtime-management.ps1                         #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 17th january 2022                               #
###################################################
<#Props to: https://gist.github.com/m-p-3/4d57843519046b2fe2da67cb659a5a74 
for the clock.
#>


$Path = "C:\Users\$env:username\Desktop\Zeitmanagement\"


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Overtime-Management by Flo'
$form.Size = New-Object System.Drawing.Size(610,360) 
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = "FixedDialog"
$Form.MaximizeBox = $false
$Form.MinimizeBox = $true
$Form.ControlBox = $true

#Cancel
$Button01 = New-Object System.Windows.Forms.Button
$Button01.Location = New-Object System.Drawing.Size(495,305)
$Button01.Size = New-Object System.Drawing.Size(100,20)
$Button01.Text = "Exit"
$form.Controls.Add($Button01)

#Come
$Button03 = New-Object System.Windows.Forms.Button
$Button03.Location = New-Object System.Drawing.Size(10,115)
$Button03.Size = New-Object System.Drawing.Size(130,60)
$Button03.Text = "Come"
$Button03.ForeColor = "#00afff"
$Button03.Font = "Arial,17,style=Bold"
$form.Controls.Add($Button03)

#Leave
$Button04 = New-Object System.Windows.Forms.Button
$Button04.Location = New-Object System.Drawing.Size(10,195)
$Button04.Size = New-Object System.Drawing.Size(130,60)
$Button04.Text = "Leave"
$Button04.ForeColor = "#00afff"
$Button04.Font = "Arial,17,style=Bold"
$form.Controls.Add($Button04)

#Clock
$clockLbl = New-Object 'System.Windows.Forms.Label'
$clockLbl.Text = (Get-Date).ToString("HH:mm:ss:ff")
$clockLbl.AutoSize = $True
$clockLbl.ForeColor = "#00afff"
$clockLbl.Location = New-Object System.Drawing.Point(0,0)
$clockLbl.Font = "Arial,32,style=Bold"
$Form.Controls.Add($clockLbl)

$timer1 = New-Object 'System.Windows.Forms.Timer'
$timer1_Tick={
    $clockLbl.Text = (Get-Date).ToString("HH:mm:ss:ff")
}

$timer1.Enabled = $True
$timer1.Interval = 1
$timer1.add_Tick($timer1_Tick)

#Clear and initialize
$Button05 = New-Object System.Windows.Forms.Button
$Button05.Location = New-Object System.Drawing.Size(10,60)
$Button05.Size = New-Object System.Drawing.Size(130,35)
$Button05.Text = "Clear and initialize profile"
$form.Controls.Add($Button05)

#Label enter Username
$label06 = New-Object System.Windows.Forms.Label
$label06.Location = New-Object System.Drawing.Point(290,5)
$label06.Size = New-Object System.Drawing.Size(110,30)
$label06.Text = 'Please enter your username here:'
$form.Controls.Add($label06)

#Input Username
$textBox06 = New-Object System.Windows.Forms.TextBox
$textBox06.Location = New-Object System.Drawing.Point(400,5)
$textBox06.Size = New-Object System.Drawing.Size(190,20)
$form.Controls.Add($textBox06)

#Load
$Button06 = New-Object System.Windows.Forms.Button
$Button06.Location = New-Object System.Drawing.Size(400,30)
$Button06.Size = New-Object System.Drawing.Size(60,20)
$Button06.Text = "Load"
$form.Controls.Add($Button06)

#Status
$label07 = New-Object System.Windows.Forms.Label
$label07.Location = New-Object System.Drawing.Point(290,35)
$label07.Size = New-Object System.Drawing.Size(110,50)
$label07.Text ="Not loaded"
$label07.ForeColor = "red"
$form.Controls.Add($label07)

#Overtime
$label08 = New-Object System.Windows.Forms.Label
$label08.Location = New-Object System.Drawing.Point(280,80)
$label08.Size = New-Object System.Drawing.Size(260,200)
$label08.Text ="Load your profile to 
see your overtime"
$label08.ForeColor = "gray"
$label08.Font = "Arial,25"
$form.Controls.Add($label08)


####################################################
#action

$Button01.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Exited by user." , "Info",0,"Info");
    $form.close()
})

#come
$Button03.Add_Click({
    $InputUserName = $textBox06.Text
    $Inputusername += ".txt"
    $test = Get-Item -Path $Path\$InputUserName | Get-Content -tail 3
    if($test[0] -ne "User logged in:"){
    "User logged in:" >> $Path\$Inputusername
    (get-date).ToString() >> $Path\$InputUserName
    "---" >> $Path\$Inputusername
    [System.Windows.Forms.MessageBox]::Show("Succesfully logged in" , "Welcome back!",0,"Info")
    }
    else{[System.Windows.Forms.MessageBox]::Show("You are already logged in!" , "Error",0,"Error")}
})

#go
$Button04.Add_Click({
    $InputUserName = $textBox06.Text
    $InputUserName += ".txt"
    $test = Get-Item -Path $Path\$InputUserName | Get-Content -tail 3
    if($test[0] -ne "User logged out:" -or $test -eq $null){
    "User logged out:" >> $Path\$InputUserName
    (get-date).ToString() >> $Path\$InputUserName
    "-------------------------" >> $Path\$InputUserName
    [System.Windows.Forms.MessageBox]::Show("Succesfully logged out" , "See you soon!",0,"Info")
    }
    else{[System.Windows.Forms.MessageBox]::Show("You are already logged out!" , "Error",0,"Error")}
})

#initialize
$Button05.Add_Click({
    $InputUserName = $textBox06.Text
    $InputUserName += ".txt"
    
    $oReturn=[System.Windows.Forms.MessageBox]::Show("Do you want to initalize the profile", "Initializing",4,"Warning")
    switch ($oReturn){
    "YES" {
    clear-content $Path\$InputUserName
    "Profile initialzized" >> $Path\$InputUserName
    (get-date).ToString() >> $Path\$InputUserName
    "---------------------------------------" >> $Path\$InputUserName 
    "testdate1 within initalization" >> $Path\$InputUserName
    (get-date).ToString() >> $Path\$InputUserName
    "---------------------------------------" >> $Path\$InputUserName 
    "testdate2 within initalization" >> $Path\$InputUserName
    (get-date).ToString() >> $Path\$InputUserName
    "---------------------------------------" >> $Path\$InputUserName 
    [System.Windows.Forms.MessageBox]::Show("Profile is initialized.","My Dialog Box",0,"Info");
    $label08.Text ="Load your profile to 
see your overtime"
$label08.ForeColor = "black"
$label08.Font = "Arial,25"
    }
    "NO" {}
  
}})

$Button06.Add_Click({
    #Successfull found
    $InputUserName = $textBox06.Text 
    $Inputusername += ".txt"
    $testingpath = Test-Path -Path $Path\$InputUserName -PathType Leaf
    
    #Profil search
    if($testingpath -eq $true){[System.Windows.Forms.MessageBox]::Show("Profile found" , "Profile found",0,"Info");
    $label07.Text ="Loaded"
    $label07.ForeColor = "green"
    

    if (((Get-ChildItem $Path\$Inputusername -Recurse | Get-Content | Measure-Object -line | select Lines).lines) -ge 9)
    {
    #Get all lines and initialize the read:
    $linesmax = (Get-ChildItem $Path\$Inputusername -Recurse | Get-Content | Measure-Object -line | select Lines).lines
    $times = 0
    $timestowork = 0
    $timestowork = ($linesmax-3)/6 
    $currentline = 1
    $work = 0
    
    #test if user is still checked out
    If([bool]!($timestowork%2))
{
    #whileloop to get your overtime from the loaded profile
    while($Times -ne $timestowork){
    $currentline = $currentline+3
    $date1 = get-date((Get-content $Path\$Inputusername )[$currentline])
    $currentline = $currentline+3
    $date2 = get-date((Get-content $Path\$Inputusername )[$currentline])
    $work += ($date2 - $date1)
    $times = $times +1
    }
    #change format
    $resultminutes= ($work | select totalminutes).totalminutes
    
    #Update the Label
    $label08.Text ="In total you have:
$resultminutes minutes 
overtime"
$label08.ForeColor = "#00afff"
$label08.Font = "Arial,25"
$form.Controls.Add($label08)
    
    }
    }
    else{[System.Windows.Forms.MessageBox]::Show("Fatal error" , "Fatal error",0,"Error");}


    }

    #Not found
    else{$oReturn=[System.Windows.Forms.MessageBox]::Show("There is no file, Should I will create it?" , "Profile not found",4,"Warning")
    switch ($oReturn){
    "YES" {
    [System.Windows.Forms.MessageBox]::Show("I have created the new file. Profile is loaded. Please initilize it first!","My Dialog Box",0,"Info");
    $label07.Text ="Loaded"
    $label07.ForeColor = "green"
    new-item $Path\$Inputusername
    } 
    "NO" {}
   }
  }
})



####################################################
#end

$form.Topmost = $True
$form.Add_Shown({$form.Activate()})
[void] $form.ShowDialog()