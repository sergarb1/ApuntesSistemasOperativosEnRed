#!/usr/bin/python3
#Instala el modulo psutil con 
#el comando "pip3 install psutil"
import psutil

# Obtener información sobre procesos
procesos = [(p.name(), p.cpu_percent(), p.memory_percent()) for p in psutil.process_iter(['pid', 'name', 'cpu_percent', 'memory_percent'])]

# Encontrar proceso con mayor uso de CPU y memoria
max_cpu_process = max(procesos, key=lambda x: x[1])
max_mem_process = max(procesos, key=lambda x: x[2])

print(f"Proceso con más CPU: {max_cpu_process[0]} ({max_cpu_process[1]:.2f}%)")
print(f"Proceso con más memoria: {max_mem_process[0]} ({max_mem_process[2]:.2f}%)")
