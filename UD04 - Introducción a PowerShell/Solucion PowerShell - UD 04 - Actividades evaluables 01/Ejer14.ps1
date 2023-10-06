# Token de tu bot de Telegram
$botToken = "TOKEN DE TU BOT"

# ID de chat de destino del mensaje (puedes obtenerlo al hablar con el bot @userinfobot en Telegram)
$chatId = "CHAT ID DE LA CUENTA QUE RECIBE EL MENSAJE"

# Obtener la RAM libre del sistema
$ramInfo = Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory

# Crear el mensaje
$message = "RAM libre: $ramInfo MB"

# Utilizar curl para enviar el mensaje al bot de Telegram
$curlCommand = "curl.exe -s -X POST -d 'chat_id=$chatId&text=$message' https://api.telegram.org/bot$botToken/sendMessage"

# Ejecutar el comando curl
Invoke-Expression -Command $curlCommand
