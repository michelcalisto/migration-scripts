#!/bin/bash

# Ruta del directorio
directory=""

# Nombre del archivo de salida
output_file="hashes_mac.txt"

# Contados de archivos
total_files=0

# Recorremos todos los archivos de la ruta del directorio y sus subdirectorios
while IFS= read -r -d '' item; do
  total_files=$((total_files + 1))
  hash=$(md5 "$item" | awk '{print $NF}')

  # Escribimos en el archivo de salida el hash y la ruta del archivo
  echo "$hash $item" >> "$output_file"
done < <(find "$directory" -type f -print0)

# Escribimos en el archivo de salida el total de archivos
echo "total: $total_files" >> "$output_file"