# Solicitar la cantidad de directorios a crear
$count = Read-Host "Introduzca la cantidad de directorios a crear (entre 0 y 999)"

# Validar que la cantidad esté en el rango correcto
if ($count -ge 0 -and $count -le 999) {

    # Crearemos los directorios en un subdirectorio tmp para luego poder
    # eliminarlos facilmente

    New-Item -ItemType Directory -Name "tmp"

    # Inicializao i a 0. La condicion a comprobar es ¿$i es menor o igual que $count?
    # y cada iteración incremento la i en uno
    for ($i = 0; $i -le $count; $i = $i + 1) {
        # Creo el nombre del directorio, usando IFs para meter los
        # ceros a la izquierda que correspondan
        $dirName = $i
        # Si el numero esta entre 0 y 9, dos ceros a la izquierda
        if (($i -ge 0) -and ($i -le 9)) {
            $dirName = "00" + [string]$i
        }
            
        # Si el numero esta entre 10 y 99, un cero a la izquierda
        elseif (($i -ge 10) -and ($i -le 99)) {
            $dirName = "0" + [string]$i
        }
        # Si el numero esta entre 100 y 999, no hay ceros a la izquierda
        else {
            $dirName = [string]$i
        }
        # Para depurar
        # Write-Host ("tmp/"+$dirName)
        New-Item -ItemType Directory -Name ("tmp/" + $dirName)
    }

    Write-Host "Directorios creados correctamente."
}
else{
    Write-Host "El rango de directorios introducido no fue correcto"
}