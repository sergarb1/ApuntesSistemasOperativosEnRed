# Solicitar la cantidad de exámenes realizados
$numExams = Read-Host "Introduzca la cantidad de exámenes realizados"

# Inicializar variables para la suma de notas y el contador de exámenes aprobados
$sumGrades = 0
$passedExams = 0

# Solicitar las notas de los exámenes y calcular la suma de notas
for ($i = 1; $i -le $numExams; $i++) {
    $grade = Read-Host "Introduzca la nota del examen $i"
    $sumGrades += [double]$grade

    # Comprobar si el examen fue aprobado (nota mayor o igual a 5)
    if ($grade -ge 5) {
        $passedExams++
    }
}

# Calcular la nota media
$averageGrade = $sumGrades / $numExams

# Mostrar resultados
Write-Host "Nota media de los exámenes: $averageGrade"
Write-Host "Cantidad de exámenes aprobados: $passedExams"
