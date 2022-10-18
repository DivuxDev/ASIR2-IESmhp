#usuarios de AD
Write-Host "los usuarios en este dominio son......"
Write-Host '------------------------------------------------------'
(Get-ADuser -Filter *).samAccountname
Write-Host '------------------------------------------------------'
#grupos de AD
Write-Host "los grupos en este dominio son......"
Write-Host '------------------------------------------------------'
(Get-ADGroup -filter *).samAccountname

Write-Host '------------------------------------------------------'
#unidades organizativas
Write-Host "las unidades organizativas en este dominio son......"
Write-Host '------------------------------------------------------'
(Get-ADOrganizationalUnit -Filter *).name