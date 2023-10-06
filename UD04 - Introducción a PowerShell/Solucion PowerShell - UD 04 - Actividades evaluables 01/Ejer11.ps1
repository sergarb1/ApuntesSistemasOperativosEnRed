# Solicitar rango de IPs
$startIP = Read-Host "Introduzca la IP de inicio (por ejemplo, 192.168.1.1)"
$endIP = Read-Host "Introduzca la IP de fin (por ejemplo, 192.168.1.254)"

# Realizar el escaneo de IPs
# Creamos un objeto "ForEach" para iterar con ese objeto
$ipRange = 1..254 | ForEach-Object { "$startIP.$_" }
#Array vacio de IPs Alcanzables
$reachableIPs = @()
#Array vacio de IPs Inalcanzables
$unreachableIPs = @()

# Iteramos con el objeto ForEach creado
foreach ($ip in $ipRange) {
    # Comprobamos la conexion
    $result = Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue
    if ($result) {
        $reachableIPs += $ip
    } else {
        $unreachableIPs += $ip
    } 
    # Si llegamos a la IP que acaba, cortamos con un break
    if($ip -eq $endIP){
        break
    }
}

# Mostrar resultados
Write-Host "IPs en marcha:"
$reachableIPs | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "IPs no en marcha:"
$unreachableIPs | ForEach-Object { Write-Host $_ }
