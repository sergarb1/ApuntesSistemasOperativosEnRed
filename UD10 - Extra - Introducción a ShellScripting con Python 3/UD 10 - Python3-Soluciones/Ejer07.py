#!/usr/bin/python3
import os

cantidad_directorios = int(input("Introduce la cantidad de directorios a crear: "))

# Crear directorios en un subdirectorio "tmp"
i = 0
while (i < cantidad_directorios):
    nombre_directorio = f"{i:03d}"
    ruta_directorio = os.path.join("tmp", nombre_directorio)
    os.makedirs(ruta_directorio)
    i = i + 1
