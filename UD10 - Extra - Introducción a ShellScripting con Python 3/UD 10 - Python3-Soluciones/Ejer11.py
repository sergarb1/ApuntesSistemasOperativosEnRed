#!/usr/bin/python3
#Instala el modulo psutil con 
#el comando "pip3 install psutil"
import psutil

def listar_procesos():
    print("\nListado de procesos:")
    for proceso in psutil.process_iter(['pid', 'name']):
        print(f"PID: {proceso.info['pid']}, Nombre: {proceso.info['name']}")

def info_detallada_proceso():
    pid = input("\nIntroduce el PID del proceso: ")
    try:
        proceso = psutil.Process(int(pid))
        print(f"\nInformación detallada del proceso con PID {pid}:")
        print(f"Nombre: {proceso.name()}")
        print(f"Estado: {proceso.status()}")
        print(f"CPU %: {proceso.cpu_percent(interval=1)}")
        print(f"Memoria %: {proceso.memory_percent()}")
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        print(f"Error: No se encontró el proceso con PID {pid}")

def parar_proceso():
    pid = input("\nIntroduce el PID del proceso que quieres detener: ")
    try:
        proceso = psutil.Process(int(pid))
        proceso.terminate()
        print(f"Proceso con PID {pid} detenido exitosamente.")
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        print(f"Error: No se pudo detener el proceso con PID {pid}")

def proceso_max_cpu():
    max_cpu_process = max(psutil.process_iter(['pid', 'name', 'cpu_percent']), key=lambda x: x.info['cpu_percent'])
    print(f"\nProceso que más CPU consume:")
    print(f"PID: {max_cpu_process.info['pid']}, Nombre: {max_cpu_process.info['name']}, CPU %: {max_cpu_process.info['cpu_percent']}")

def proceso_max_memoria():
    max_mem_process = max(psutil.process_iter(['pid', 'name', 'memory_percent']), key=lambda x: x.info['memory_percent'])
    print(f"\nProceso que más memoria ocupa:")
    print(f"PID: {max_mem_process.info['pid']}, Nombre: {max_mem_process.info['name']}, Memoria %: {max_mem_process.info['memory_percent']}")

def menu():
    while True:
        print("\nMenú:")
        print("1. Ver listado de procesos.")
        print("2. Ver información detallada de un proceso.")
        print("3. Parar un proceso en marcha.")
        print("4. Ver el proceso que más CPU consume.")
        print("5. Ver el proceso que más memoria ocupa.")
        print("6. Salir.")

        opcion = input("\nElige una opción (1-6): ")

        if opcion == '1':
            listar_procesos()
        elif opcion == '2':
            info_detallada_proceso()
        elif opcion == '3':
            parar_proceso()
        elif opcion == '4':
            proceso_max_cpu()
        elif opcion == '5':
            proceso_max_memoria()
        elif opcion == '6':
            print("Saliendo del programa. ¡Hasta luego!")
            break
        else:
            print("Opción no válida. Por favor, elige una opción del 1 al 6.")

if __name__ == "__main__":
    menu()
