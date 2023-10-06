# Crear un array vacío con 100 elementos
$vector = @()

# Generar y agregar números aleatorios al vector utilizando un bucle for
for ($i = 0; $i -lt 100; $i++) {
    $randomNumber = Get-Random -Minimum 1 -Maximum 1000  # Puedes ajustar los límites según tus necesidades
    $vector += $randomNumber
}

# Mostrar el vector lleno de números aleatorios
Write-Host "Vector de 100 elementos con números aleatorios:"
$vector
