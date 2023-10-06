# Solicitar nombre de usuario
$username = Read-Host "Introduzca el nombre de usuario"

# Crear el usuario local sin contraseña
New-LocalUser -Name $username -NoPassword
