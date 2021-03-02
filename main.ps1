Import-Module ActiveDirectory
$Domaine = "domain.local"
$ListeOrdinateur = Get-ADComputer -Filter * -Properties LastLogonTimeStamp | Select-Object Name,@{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogonTimeStamp)}}
Write-Output $ListeOrdinateur
$ListeOrdinateur | Export-CSV C:\Users\ADMIN\Desktop\ComputerList.csv -NoTypeInformation -Encoding UTF8
