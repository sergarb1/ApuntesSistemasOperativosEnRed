# Obtener el proceso con mayor uso de CPU (por número de hilos)
$cpuProcess = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1

# Obtener el número de hilos del proceso con mayor uso de CPU
$cpuThreads = $cpuProcess.Threads.Count

# Obtener el proceso con mayor uso de memoria (por número de hilos)
$memoryProcess = Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 1

# Obtener el número de hilos del proceso con mayor uso de memoria
$memoryThreads = $memoryProcess.Threads.Count

# Mostrar resultados
Write-Host "Proceso con mayor uso de CPU:"
Write-Host "Nombre: $($cpuProcess.Name)"
Write-Host "Número de hilos: $cpuThreads"
Write-Host ""

Write-Host "Proceso con mayor uso de memoria:"
Write-Host "Nombre: $($memoryProcess.Name)"
Write-Host "Número de hilos: $memoryThreads"
