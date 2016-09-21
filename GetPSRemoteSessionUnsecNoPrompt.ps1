# command example: .\GetPSRemoteSessionUnsecNoPrompt.ps1 192.161.17.56 Admin admin
param (
    [string]$ComputerName = $(throw "-ComputerName is required."),
	[string]$UserName = $(throw "-UserName is required."),
	[string]$UserPass = $(throw "-UserPass is required.")
 )
$UserPassword=ConvertTo-SecureString  $UserPass -AsPlainText -Force;

# Provide your username and password (by default "Admin" and the password you just obtained)
# $c=Get-Credential -Credential $UserName
$c=New-Object System.Management.Automation.PSCredential($UserName,$UserPassword);
$opt = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$session = New-PSSession -ComputerName $ComputerName -UseSSL -SessionOption $opt -Authentication Basic -Credential $c
Enter-PSSession $session
