#!/usr/bin/python3
import random

# Rellenar vector con 100 elementos aleatorios
vector = []
for i in range(100):
    vector.append(random.randint(1, 100))

for i in range(100):
    print("Posición "+str(i)+" valor "+str(vector[i]))