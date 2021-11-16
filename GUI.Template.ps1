###################################################
# GUI.Template.ps1                                #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 16th november 2021                              #
###################################################



#Initialize the GUI
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")      #Needed to start the GUI
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

#Window Default
$Form = New-Object System.Windows.Forms.Form
$form.Text = 'Windows Powershell Form by Flo'
$Form.Size = New-Object System.Drawing.Size(720,360)                            #Scale of the Window
$Form.FormBorderStyle = "FixedDialog"
$Form.TopMost = $true
$Form.MaximizeBox = $false
$Form.MinimizeBox = $true
$Form.ControlBox = $true
$Form.StartPosition = "CenterScreen"
$Form.Font = "Comic Sans MS,10"                                                 #Other Fonts -> See also in "GUI.FontDialog2.ps1"
$Form.ForeColor = "White"
$Form.BackColor = "Black"

###############################################################################

#Buttons, Labels etc.

#Label
$label = New-Object System.Windows.Forms.Label                                  #Initialize the Label
$label.Location = New-Object System.Drawing.Point(10,20)                        #Position of the GUI (Starting 'counting' from upper left)
$label.Size = New-Object System.Drawing.Size(280,20)                            #Size of the GUI
$label.Text = 'This is a label'                                                 #The real Label
$form.Controls.Add($label)                                                      #Add the Label into the GUI

#TextBoxes
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBox)

#Listbox
$ListBox = New-Object System.Windows.Forms.Listbox                              #ListBox
$ListBox.Location = New-Object System.Drawing.Size(10,60)
$ListBox.Size = New-Object System.Drawing.Size(280,20)
$ListBox.SelectionMode = "MultiExtended"
[void] $ListBox.Items.Add("1. User")
[void] $ListBox.Items.Add("2. Computer")
[void] $ListBox.Items.Add("3. E-Mail")
$ListBox.Height = 70
$Form.Controls.Add($ListBox)

#ComboBox
$ComboBox = New-Object System.Windows.Forms.Combobox                            #ComboBox
$ComboBox.Location = New-Object System.Drawing.Size(10,80)
$ComboBox.Size = New-Object System.Drawing.Size(280,20)
$ComboBox.Height = 70
$forms.Controls.Add($ComboBox)
$ComboBox.Topmost = $True
$ComboBox.Add_SelectedIndexChanged({ })

#Button                                                                         #Buttons
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(10,100)
$Button.Size = New-Object System.Drawing.Size(280,20)
$Button.Text = "Im a Button lmao"
$forms.Controls.Add($Button)
<# 
Action                                                                          #Buttons Action
$Button.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
})
#>

#Links                                                                          #Links
$LinkLabel = New-Object System.Windows.Forms.LinkLabel
$LinkLabel.Location = New-Object System.Drawing.Size(30,50)
$LinkLabel.Size = New-Object System.Drawing.Size(150,20)
$LinkLabel.Text = "Your Link Text"
$Form.Controls.Add($LinkLabel)
#Action f.e:                                                                    #Links Action
$LinkLabel.add_Click({[system.Diagnostics.Process]::start("calc.exe")})



#Start/Display the GUI Window                                                   #Starting GUI
$GuiWindow.Topmost = $True
$GuiWindow.Add_Shown({$GuiWindow.Activate()})
[void] $GuiWindow.ShowDialog()