.\windows.ps1 -ruta "C:\MiSistema\"
.\windows_db.ps1 -ruta "C:\MiBasedeDatos\"

./unix.sh "/MiSistemaMigrado/"

./comparativa.sh "/hashes_windows.txt" "/hashes_centos.txt"