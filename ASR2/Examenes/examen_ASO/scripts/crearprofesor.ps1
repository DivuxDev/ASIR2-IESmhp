New-ADUser -Name 'prefesor00'
 -Path 'ou=claseASO,dc=aso218,dc=priv'
 -SamAccountName 'alumno1' -Type 'user' 
 -userprincipalname ('alumno1'+'@'+'ASO218.priv')
 -AccountPassword (ConvertTo-SecureString -AsPlainText 'usuario@1' -force) 
 -passwordneverexpires $false 
 -changepasswordatlogon $true