# Ruta del directorio
$directory = "C:\xampp\htdocs\documentos\docs"

# Destinatario
$destination = "root@10.5.9.253:/var/www/html/documentos/docs/"

# Contados de archivos
$total_files = 0

# Posicion del archivo
$file_index = [int]$args[0]
#$file_index = 90

# vars
$var1 = ''
$var2 = ''
$var3 = ''
$var4 = ''
$var5 = ''
$var6 = ''
$var7 = ''
$var8 = ''
$var9 = ''
$var10 = ''
$var11 = ''
$var12 = ''
$var13 = ''
$var14 = ''
$var15 = ''
$var16 = ''
$var17 = ''
$var18 = ''
$var19 = ''
$var20 = ''

$varcount = 1

# Recorremos todos los archivos de la ruta del directorio y sus subdirectorios
Get-ChildItem -Path $directory -Recurse | ForEach-Object {
    if ($_.GetType().Name -ne "DirectoryInfo") {
        $file = $_.FullName
        if ($total_files -ge $file_index -and $total_files -lt $file_index+3) {    
            #$var+$varcount.ToString() = $file
            Write-Host $file
            Set-Variable -Name "var$varcount" -Value $file
            
            #scp $file $destination
            $varcount++
        }
        $total_files++
        #if ($total_files % 10 -eq 0) {
        #    Write-Host "Presiona Enter para continuar..."
        #    [System.Console]::ReadLine()
        #}    
    }
}

#Write-Host "el valor de `$var1` es: '$var1'"

Write-Host scp "'$var1'" "'$var2'" "'$var3'" "'$var4'" "'$var5'" "'$var6'" "'$var7'" "'$var8'" "'$var9'" "'$var10'" "'$var11'" "'$var12'" "'$var13'" "'$var14'" "'$var15'" "'$var16'" "'$var17'" "'$var18'" "'$var19'" "'$var20'" $destination
#scp $var1 $destination
#scp $var1 $var2 $var3 $var4 $var5 $var6 $var7 $var8 $var9 $var10 $destination