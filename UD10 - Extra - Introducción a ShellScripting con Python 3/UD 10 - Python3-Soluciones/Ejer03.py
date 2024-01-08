#!/usr/bin/python3
import subprocess

nombre_usuario = input("Introduce el nombre de usuario: ")
contrasena = input("Introduce la contraseña: ")

# Crear usuario con contraseña
subprocess.run(["sudo", "useradd", "-p", contrasena, nombre_usuario])

