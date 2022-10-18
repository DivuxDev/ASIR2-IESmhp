$csvcontent = Import-CSV -Path "C:\usuario.csv"
foreach ($user in $csvcontent)
{
New-ADUser -name $user.usuario -Path 'ou=claseASO,dc=aso218,dc=priv' -SamAccountName $user.usuario -AccountPassword (ConvertTo-SecureString -AsPlainText $user.contrasena -force) -enabled $true
}