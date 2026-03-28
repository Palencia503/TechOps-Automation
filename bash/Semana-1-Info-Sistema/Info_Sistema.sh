#!/bin/bash
#Script de la Semana 1

echo "--- INFORMACIÓN DEL SISTEMA ---"
uptime  # Muestra el tiempo que lleva encendido y carga [cite: 22]

echo -e "\n--- ESPACIO EN DISCO ---"
df -h | grep '^/dev/' # Comprueba el espacio en disco de forma legible [cite: 22]

echo -e "\n--- USUARIOS EN EL SISTEMA ---"
cut -d: -f1 /etc/passwd | head -n 10 # Lista los primeros 10 usuarios [cite: 22]
