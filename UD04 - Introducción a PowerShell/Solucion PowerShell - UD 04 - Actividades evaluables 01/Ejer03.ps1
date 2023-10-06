# Solicitar nombre de usuario y contraseña
$username = Read-Host "Introduzca el nombre de usuario"
# Se usa -AsSecureString para no mostar la cadena
$password = Read-Host "Introduzca la contraseña" -AsSecureString

# Crear el usuario local con la contraseña proporcionada
New-LocalUser -Name $username -Password $password
