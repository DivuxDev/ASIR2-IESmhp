Write-Host 'Tu ordenador se llama...'
(get-computerinfo).csname

Write-Host 'Tu ip es...'

(Get-NetIPAddress -interfacealias interna).IPv4Address

Write-Host 'Tu dominio se llama...'

(get-computerinfo).csdomain