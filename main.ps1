Import-Module ActiveDirectory
$Domaine = "domain.local"
$ListeOrdinateur = Get-ADComputer -Filter * -Properties LastLogonTimeStamp | FT Name,@{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogonTimeStamp)}}
Write-Output $ListeOrdinateur
