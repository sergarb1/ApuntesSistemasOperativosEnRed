#!/usr/bin/python3
import subprocess

nombre_usuario = input("Introduce el nombre de usuario: ")

# Crear usuario sin contraseña
subprocess.run(["sudo", "useradd", nombre_usuario])
