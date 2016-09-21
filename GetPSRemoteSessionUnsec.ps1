# command example: .\GetPSRemoteSessionUnsec.ps1 192.161.17.56 Administrator
param (
    [string]$ComputerName = $(throw "-ComputerName is required."),
	[string]$UserName = $(throw "-UserName is required.")
 )

# Provide your username and password (by default "Admin" and the password you just obtained)
$c=Get-Credential -Credential $UserName
$opt = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
$session = New-PSSession -ComputerName $ComputerName -UseSSL -SessionOption $opt -Authentication Basic -Credential $c
Enter-PSSession $session
