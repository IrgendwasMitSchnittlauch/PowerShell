[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Windows Powershell Form by Flo'
$form.Size = New-Object System.Drawing.Size(720,360) 


$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(10,100)
$Button.Size = New-Object System.Drawing.Size(280,20)
$Button.Text = "No"
$form.Controls.Add($Button)

$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Size(300,100)
$Button1.Size = New-Object System.Drawing.Size(280,20)
$Button1.Text = "Yes"
$form.Controls.Add($Button1)


$Button.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
})

$Button1.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("No world." , "My Dialog Box");
    start calc.exe
})

$form.Topmost = $True
$form.Add_Shown({$form.Activate()})
[void] $form.ShowDialog()
