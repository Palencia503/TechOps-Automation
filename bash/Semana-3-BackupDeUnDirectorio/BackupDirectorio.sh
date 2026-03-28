#!/bin/bash
# Semana 3 -  Copia de seguridad directa
ORIGEN="/home/jp/Documents"    # Carpeta a salvar
DESTINO="/home/jp/Backups"     # Carpeta de destino
FECHA=$(date +%Y-%m-%d_%H%M)   # Marca de tiempo

# 1. Crear el directorio de destino con la fecha para no sobrescribir la anterior
mkdir -p "$DESTINO/copia_$FECHA"

# 2. Copiar todo el contenido de forma recursiva
cp -r "$ORIGEN/." "$DESTINO/copia_$FECHA/"

# 3. Verificación simple
if [ $? -eq 0 ]; then
    echo "[$FECHA] Backup copiado correctamente en $DESTINO/copia_$FECHA"
else
    echo "[$FECHA] Error al copiar los archivos"
fi
