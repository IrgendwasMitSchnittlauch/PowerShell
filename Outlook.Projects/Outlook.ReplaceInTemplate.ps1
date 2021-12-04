###################################################
# Outlook.ReplaceInTemplate.ps1                   #
#                                                 #
# published by Schnittlauch                       #
# admin@schaffamuasch.onmicrosoft.com             #
#                                                 #
# 04th december 2021                              #
###################################################
 
#Change these values:
$workdir = "C:\users\$env:UserName\downloads\"
$mailtemplate01 = "mail.txt"
$Subject = "This is a subject"
$BCC = "John.Doe@microsoft.com"

#Replacing:
$TextInMail = ""
$TextReplaced = ""

#Initialising
$ol = New-Object -comObject Outlook.Application
$mail = $ol.CreateItem(0)

#Change mail text:
$template = get-content "$workdir$mailtemplate01"
$template.replace($TextInMail,$TextReplaced)

#mail propertys
$mail.Subject = "$Subject"
$mail.Bcc = $BCC
$mail.HTMLBody = $template

#Show the finished mail, to correct it, save it or whatever :)
$inspector = $mail.GetInspector
$inspector.Activate()
