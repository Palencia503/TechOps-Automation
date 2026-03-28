#!/bin/bash
#Semana 2 - Creación masiva de usuarios
input="usuarios.csv"

while IFS= read -r user
do
  sudo useradd -m -s /bin/bash "$user"
  echo "Usuario $user creado con éxito."
done < "$input"
