# Función para enviar una imagen al bot
function EnviarImagenATelegram {
    param (
        [string]$imagePath
    )

    
    # Token de tu bot de Telegram
    $botToken = "TOKEN DE TU BOT"

    # ID de chat de destino del mensaje (puedes obtenerlo al hablar con el bot @userinfobot en Telegram)
    $chatId = "ID CHAT DEL QUE RECIBE EL CHAT"
    # URL de la API de enviar imagenes de Telegram
    $url = "https://api.telegram.org/bot$botToken/sendPhoto"

    # Utilizar curl para enviar el mensaje al bot de
    $curlCommand = "curl.exe -X  POST $url -F chat_id=$chatId -F photo=@$imagePath"
    # Para depurar si el comando lo hemos generado correctamente 
    # Write-Host $curlCommand

    # Ejecutar el comando curl
    Invoke-Expression -Command $curlCommand
}



# Directorio que contiene las imágenes
$directoryPath = "imagenes"

# Obtener la lista de nombres de archivo de imágenes en el directorio
$imageFiles = Get-ChildItem -Path $directoryPath -Filter "*.jpg" | Sort-Object Name


# Bucle infinito para enviar imágenes aleatorias cada minuto
while ($true) {
    # Obtenemos un valor aleatorio entre el numero de imagenes del directorio
    $randomIndex = Get-Random -Minimum 0 -Maximum ($imageFiles.Count - 1)
    $randomImage = $imageFiles[$randomIndex].FullName
    # LLamamos a la funcion "EnviarImagenATelegram"
    EnviarImagenATelegram -imagePath $randomImage

    # Esperar 1 minuto antes de enviar la próxima imagen
    Start-Sleep -Seconds 60
}
