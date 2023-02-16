# Ruta del directorio
param(
    [Parameter(Mandatory=$true)]
    [string]$ruta
)

# Nombre del archivo de salida
$output_file = "hashes_windows_db.txt"

# Recorremos todos los archivos de la ruta del directorio y sus subdirectorios
Get-ChildItem -Path $ruta -Recurse | ForEach-Object {
    if ($_.GetType().Name -ne "DirectoryInfo") {
        $file = $_.FullName
        $hash = Get-FileHash -Path $file -Algorithm MD5
        $line = "{0} {1}" -f $hash.Hash, $file

        # Escribimos en el archivo de salida el hash y la ruta del archivo
        Add-Content -Path $output_file -Value $line
    }
}
$output_file_path = Join-Path $PWD $output_file

# Imprimimos la ruta del archivo de salida
Write-Host "El archivo de salida se encuentra en: $output_file_path"