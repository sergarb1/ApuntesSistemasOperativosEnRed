# Obtener el proceso con mayor uso de CPU
$cpuUsage = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1

# Obtener el proceso con mayor uso de memoria
$memoryUsage = Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 1

# Mostrar resultados
Write-Host "Programa con mayor uso de CPU:"
Write-Host "Nombre: $($cpuUsage.Name)"
Write-Host "Uso de CPU: $($cpuUsage.CPU) %"
Write-Host ""

Write-Host "Programa con mayor uso de memoria:"
Write-Host "Nombre: $($memoryUsage.Name)"
Write-Host "Uso de memoria: $($memoryUsage.WorkingSet / 1MB) MB"
