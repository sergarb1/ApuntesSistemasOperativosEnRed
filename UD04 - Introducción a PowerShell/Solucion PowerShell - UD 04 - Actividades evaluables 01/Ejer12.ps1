$choice = 0

while ($choice -ne 6) {
    Write-Host "Menú Principal"
    Write-Host "1. Ver listado de procesos"
    Write-Host "2. Ver información detallada de un proceso"
    Write-Host "3. Parar un proceso en marcha"
    Write-Host "4. Ver el proceso que más CPU consume"
    Write-Host "5. Ver el proceso que más memoria ocupa"
    Write-Host "6. Salir"

    $choice = Read-Host "Seleccione una opción (1-6)"

    # De manera alternativa a usar varios if, usamos Switch
    switch ($choice) {
        1 {
            Get-Process | Format-Table -AutoSize
        }
        2 {
            $processName = Read-Host "Introduzca el nombre del proceso"
            Get-Process $processName | Format-Table -AutoSize
        }
        3 {
            $processName = Read-Host "Introduzca el nombre del proceso a detener"
            Stop-Process -Name $processName -Force
        }
        4 {
            Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1 | Format-Table -AutoSize
        }
        5 {
            Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 1 | Format-Table -AutoSize
        }
        6 {
            Write-Host "Saliendo del programa."
        }
        default {
            Write-Host "Opción no válida. Por favor, seleccione una opción válida (1-6)."
        }
    }
}
