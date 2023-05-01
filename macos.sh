#!/bin/bash

# Ruta del directorio
ruta=$1

# Nombre del archivo de salida
output_file="hashes_macos.txt"

# Contados de archivos
total_files=0

# Recorremos todos los archivos de la ruta del directorio y sus subdirectorios
while IFS= read -r -d '' item; do
  total_files=$((total_files + 1))
  hash=$(md5 "$item" | awk '{print $4}')

  # Escribimos en el archivo de salida el hash y la ruta del archivo
  echo "$hash $item" >> "$output_file"
done < <(find "$ruta" -type f -print0)

# Escribimos en el archivo de salida el total de archivos
echo "total: $total_files" >> "$output_file"

path=$(readlink -f "$output_file")

# Imprimimos la ruta del archivo de salida
echo "El archivo de salida se encuentra en: $path"