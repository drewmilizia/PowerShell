$PrimarySMTP = ""

Function Check-DuplicateUser {

$ADFilter="(&(msExchRecipientTypeDetails=*)(mail=*)(|(mail=$PrimarySMTP)(UserPrincipalName=$PrimarySMTP)(ProxyAddresses=*smtp:$PrimarySMTP*)))"
$ADSearcher = New-Object System.DirectoryServices.DirectorySearcher($ADFilter)
$Count = $ADSearcher.FindAll().Count

If ($Count -ne 0) {

Return $True

    }

Else {

    Return $False

    }

}

$Exists = Check-DuplicateUser $PrimarySMTP

$Exists