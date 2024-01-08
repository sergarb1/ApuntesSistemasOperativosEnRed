#!/usr/bin/python3
import subprocess

nombre_usuario = input("Introduce el nombre de usuario: ")

# Verificar si existe el usuario
try:
    subprocess.run(["id", nombre_usuario])
except subprocess.CalledProcessError:
    print(f"Error: El usuario {nombre_usuario} no existe.")
else:
    # Desactivar cuenta
    subprocess.run(["sudo", "usermod", "-L", nombre_usuario])
    print(f"Cuenta de {nombre_usuario} desactivada.")
