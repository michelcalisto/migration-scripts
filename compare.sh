#!/bin/bash

# Nombre del archivo de origen
file1=$1

# Nombre del archivo de destino
file2=$2

# Nombre del archivo de salida
output="comparison_results.txt"

# Contador de líneas
line_number=1

# Contador de errores
errors=0

# Número de líneas en el archivo
number_of_lines=$(wc -l < "$file1")

# Verifica que ambos archivos existan
if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
  echo "[ERROR] Uno o ambos archivos no existen."
  exit 1
fi

while read -r line || [ -n "$line" ]; do
  hash=$(echo $line | awk '{print $1}')
  upper=$(echo "$hash" | tr '[:upper:]' '[:lower:]')
  if [ "$line_number" -ne "$number_of_lines" ]; then
    if [ ${#upper} -eq 32 ]; then
      if grep -q "$upper" $file2; then
        echo "[OK] $line" >> $output
      else
        echo "[ERROR] $line" >> $output
        errors=$((errors + 1))
      fi
    else
      echo "El hash: $hash debe ser de 32 caracteres" >> $output
    fi
  fi
  line_number=$((line_number + 1))
done < "$file1"

echo "" >> $output
echo "[NOTE] El número de errores encontrados son: $errors" >> $output

# Verifica que ambos archivos tengan la misma cantidad de líneas
if [ $(wc -l <"$file1") != $(wc -l <"$file2") ]; then
  echo "" >> $output
  echo "[NOTE] Ambos archivos no tienen el mismo número de líneas." >> $output
fi

path=$(readlink -f "$output")

# Imprimimos la ruta del archivo de salida
echo "Los resultados se han almacenado en el archivo de salida, que se encuentra en: $path"