$user = Read-Host "Enter username"
$getuser = get-ADUser -Identity $user -Properties *
$pls = (get-ADUser $user -properties PasswordLastSet).PasswordLastSet
$date = Get-Date -Format G
$begin = [datetime]$pls
$end = [datetime]$date

$passwordAge = ((New-TimeSpan -End $end -Start $pls).Days).toString()
$pwdAge = (((New-TimeSpan -End $end -Start $pls).Days).toString())
$daysLeft = (90-$pwdAge).toString() + " days before $user password expires"
$getuser | Add-Member -NotePropertyName PasswordAgeInDays -NotePropertyValue $passwordAge -Force
$getuser | Add-Member -NotePropertyName DaysBeforePasswordExpires -NotePropertyValue $daysLeft -Force
#$getuser.PasswordAgeInDays
#$getuser.DaysBeforePasswordExpires
$UserInformation = $getuser | Select-Object Name,samAccountName,LastLogonDate,LastBadPasswordAttempt,PasswordAgeInDays | Format-List
