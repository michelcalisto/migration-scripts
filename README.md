# Migration Scripts

Scripts para la migración de proyectos.

## Uso

```bash
# genera un archivo de texto hashes_windows.txt con el hash MD5 y la ruta de todos los archivos de la ruta C:\MiSistema\
$ .\windows.ps1 -ruta "C:\MiSistema\"
```

```bash
# genera un archivo de texto hashes_centos.txt con el hash MD5 y la ruta de todos los archivos de la ruta /MiSistemaMigrado/
$ ./unix.sh "/MiSistemaMigrado/"
```

```bash
# recorre cada linea de texto del archivo hashes_windows.txt, almacena el hash y la ruta, luego busca si el hash se encuentra en el archivo hashes_centos.txt, en el caso de que el hash se encuentre, imprime [OK] y la ruta del archivo, en el caso de que el hash no se encuentre, imprime [ERROR] y la ruta del archivo, una vez recorrido todo el archivo, se imprime el total de [ERROR] encontrados, finalmente se genera un archivo de texto comparison_results.txt con esta información.
$ ./compare.sh "/hashes_windows.txt" "/hashes_centos.txt"
```