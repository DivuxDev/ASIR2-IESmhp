 #ejercicio 10.1 Por David Prado
 Write-Host "El hardware que hay en tu equipo es...."
 Write-Host "Procesador ---->" (Get-CimInstance -ClassName Win32_Processor).Name 
 Write-Host "Memoria ---->" (Get-CIMInstance Win32_physicalmemory).Manufacturer
 Write-Host "Discos ---->" (Get-CimInstance -ClassName Win32_DiskDrive).Caption

 write-host 'El sistema operativo es este ---->'(Get-CimInstance Win32_OperatingSystem | select *).caption
 write-host 'Los usuarios son estos ---->' (Get-Localuser).name

 Write-Host "Los procesos son estos ---->" (Get-WmiObject win32_process) | Select-Object Processid,Name 

