# Ej9.18 Por David 
Write-Host "Los email de los alumnos son:"
foreach ($item in .\lista.csv)
{
($item).email
}