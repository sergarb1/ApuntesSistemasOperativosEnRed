#!/usr/bin/python3
cantidad_examenes = int(input("Introduce la cantidad de exámenes realizados: "))
notas = []

# Pedir notas de los exámenes
for i in range(cantidad_examenes):
    nota = float(input(f"Introduce la nota del examen {i + 1}: "))
    notas.append(nota)

# Calcular nota media
nota_media = sum(notas) / cantidad_examenes

# Contar exámenes aprobados
aprobados = sum(1 for nota in notas if nota >= 5)

print(f"Nota media: {nota_media:.2f}")
print(f"Exámenes aprobados: {aprobados}")
