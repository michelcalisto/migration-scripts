# Ruta del directorio
param(
    [Parameter(Mandatory=$true)]
    [string]$ruta
)

# Nombre del archivo de salida
$output_file = "hashes_windows.txt"

# Contados de archivos
$total_files = 0

# Recorremos todos los archivos de la ruta del directorio y sus subdirectorios
Get-ChildItem -Path $ruta -Recurse | ForEach-Object {
    if ($_.GetType().Name -ne "DirectoryInfo") {
        $total_files++
        $file = $_.FullName
        $hash = Get-FileHash -Path $file -Algorithm MD5
        $line = "{0} {1}" -f $hash.Hash, $file

        # Escribimos en el archivo de salida el hash y la ruta del archivo
        Add-Content -Path $output_file -Value $line
    }
}

# Escribimos en el archivo de salida el total de archivos
Add-Content -Path $output_file -Value "total: $total_files"

$output_file_path = Join-Path $PWD $output_file

# Imprimimos la ruta del archivo de salida
Write-Host "El archivo de salida se encuentra en: $output_file_path"