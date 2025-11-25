# Obtiene todos los archivos dentro de la carpeta indicada, incluyendo subcarpetas.
# Get-ChildItem: lista elementos del sistema de archivos.
# "C:\ruta\carpeta": ruta raíz desde la que se quieren recolectar los archivos.
# -Recurse: busca de manera recursiva en todos los subdirectorios.
# -File: limita los resultados solo a archivos (excluye carpetas).
# -ErrorAction SilentlyContinue: evita mostrar mensajes de error si alguna ruta no se puede leer.
$files = Get-ChildItem "C:\ruta\carpeta" -Recurse -File -ErrorAction SilentlyContinue |
         # Select-Object -ExpandProperty FullName: extrae únicamente la ruta completa de cada archivo,
         # generando una lista con rutas absolutas que luego se utilizarán en el ZIP.
         Select-Object -ExpandProperty FullName

# Comprime los archivos recogidos previamente en un archivo ZIP.
# Compress-Archive: cmdlet usado para crear archivos .zip.
# -Path $files: indica qué archivos se incluirán (las rutas obtenidas antes).
# -DestinationPath: ruta y nombre del archivo ZIP resultante.
# -Force: sobrescribe el zip si ya existe sin pedir confirmación.
Compress-Archive -Path $files -DestinationPath "C:\ruta\archivo.zip" -Force
