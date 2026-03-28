#!/bin/bash
#Semana 4 - Informe de Procesos
INFORME="/home/jp/Backups/informe_sistema.txt"
FECHA=$(date '+%Y-%m-%d %H:%M:%S')

echo "------------------------------------------" >> $INFORME
echo "INFORME DE ESTADO - $FECHA" >> $INFORME
echo "------------------------------------------" >> $INFORME

#1.TOP 5 Procesos por uso de memoria
echo "[MEMORIA] Top 5 procesos consumiendo recursos:" >> $INFORME
ps aux --sort=-%mem | head -n 6 >> $INFORME

#2.Alerta de servicio esencial (SSH en este caso)
SERVEI="sshd"
if pgrep -x "$SERVEI" > /dev/null
then
    echo "[ESTADO] El servicio $SERVEI está funcionando correctamente." >> $INFORME
else
    echo "[ALERTA] !!! El servicio $SERVEI NO está en ejecución !!!" >> $INFORME
fi

echo -e "\n" >> $INFORME
echo "Informe generado con éxito."
