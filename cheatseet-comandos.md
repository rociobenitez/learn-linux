# Tabla de comandos

## Navegación y gestión de archivos y directorios

| Comando |                                      | Descripción                                                                                           |
| ------- | ------------------------------------ | ----------------------------------------------------------------------------------------------------- |
| `ls`    | `[opciones] [fichero/directorio]`    | Listar archivos y directorios                                                                         |
|         | `ls -l`                              | Listar con detalles (permisos, propietario, tamaño, fecha)                                            |
|         | `ls -lh`                             | Listar con detalles en un formato legible (tamaños en KB, MB...)                                      |
|         | `ls -a`                              | Listar incluidos los ocultos                                                                          |
|         | `ls -la`                             | Listar con detalles incluidos los ocultos                                                             |
|         | `ls -lt`                             | Listar con detalles ordenados por fecha (más recientes primero)                                       |
|         | `ls -ltr`                            | Listar con detalles ordenados por fecha (más antiguos primero)                                        |
|         | `ls -s`                              | Listar mostrando el tamaño de cada archivo en bloques de 1 KB                                         |
|         | `ls -R`                              | Listar de forma recursiva todos los subdirectorios                                                    |
| `pwd`   |                                      | Mostrar el directorio actual                                                                          |
| `cd`    | `[directorio]`                       | Cambiar de directorio                                                                                 |
|         | `cd ~`                               | Ir al directorio home del usuario                                                                     |
|         | `cd -`                               | Volver al directorio anterior                                                                         |
|         | `cd ..`                              | Subir un nivel en la jerarquía de directorios                                                         |
| `sudo`  | `[comando]`                          | Ejecutar un comando con privilegios de superusuario                                                   |
| `nano`  | `[fichero]`                          | Editar archivo de texto con el editor nano                                                            |
| `touch` | `[fichero]`                          | Crear nuevo archivo vacío o actualizar la fecha de modificación                                       |
| `mkdir` | `[directorio]`                       | Crear nuevo directorio                                                                                |
| `cp`    | `[opciones] [origen] [destino]`      | Copiar fichero o directorio                                                                           |
| `mv`    | `[opciones] [origen] [destino]`      | Mover o renombrar fichero o directorio                                                                |
| `rmdir` | `[directorio]`                       | Eliminar directorio vacío                                                                             |
| `rm`    | `[opciones] [fichero]`               | Eliminar fichero                                                                                      |
|         | `rm -r`                              | Eliminar un directorio y su contenido de forma recursiva.                                             |
| `find`  | `[ruta] -name [patrón]`              | Buscar archivos y directorios por **nombre**                                                          |
|         | `[ruta] -iname [patrón]`             | Buscar archivos y directorios por nombre **sin distinguir mayúsculas/minúsculas**                     |
|         | `[ruta] -not -name [patrón]`         | Buscar archivos y directorios que **no coincidan** con el nombre indicado                             |
|         | `[ruta] -type [f\|d] -name [patrón]` | Buscar archivos (`f`) o directorios (`d`) por nombre                                                  |
|         | `[ruta] -size [+-]n[cwbkMG]`         | Buscar archivos por **tamaño** (n: tamaño, c: bytes, w: palabras, b: bloques, k: KB, M: MB, G: GB)    |
|         | `/ -size 10M`                        | Buscar archivos de exactamente 10 MB                                                                  |
|         | `/ -size +100k`                      | Buscar archivos de más de 100 KB                                                                      |
|         | `/ -size -500c`                      | Buscar archivos de menos de 500 bytes                                                                 |
|         | `[ruta] -mtime [+-]n`                | Buscar archivos **modificados** hace n días (`+n`: más de n días, `-n`: menos de n días)              |
|         | `[ruta] -atime [+-]n`                | Buscar archivos **accedidos** hace n días (`+n`: más de n días, `-n`: menos de n días)                |
|         | `[ruta] -ctime [+-]n`                | Buscar archivos cuyo **estado cambió** hace n días (`+n`: más de n días, `-n`: menos de n días)       |
|         | `[ruta] -user [usuario]`             | Buscar archivos y directorios por **propietario**                                                     |
|         | `[ruta] -group [grupo]`              | Buscar archivos y directorios por **grupo**                                                           |
|         | `[ruta] -perm [modo]`                | Buscar archivos y directorios por **permisos**                                                        |
|         | `[ruta] -empty`                      | Buscar archivos y directorios **vacíos**                                                              |
|         | `find /home -name "*.txt"`           | Buscar todos los archivos `.txt` en el directorio `/home`                                             |
| `file`  | `[fichero]`                          | Muestra el **tipo** de un archivo en cuanto a su categoría en el sistema de archivos (tipo y formato) |
| `tree`  | `[opciones] [directorio]`            | Mostrar la estructura de directorios en forma de árbol                                                |
|         | `tree -a`                            | Incluir archivos ocultos en la visualización del árbol                                                |
|         | `tree -L n`                          | Limitar la profundidad del árbol a `n` niveles                                                        |
|         | `tree -d`                            | Mostrar solo directorios en la visualización del árbol                                                |
|         | `tree -h`                            | Mostrar tamaños de archivos en formato legible en la visualización del árbol                          |
| `ln`    | `-s [origen] [destino]`              | Crear un enlace simbólico (acceso directo)                                                            |

## Comandos informativos del sistema

| Comando   |                                 | Descripción                                                                  |
| --------- | ------------------------------- | ---------------------------------------------------------------------------- |
| `uname`   | `[opciones]`                    | Mostrar información detallada del sistema operativo                          |
| `man`     | `[comando]`                     | Mostrar el manual de un comando                                              |
| `history` |                                 | Mostrar el historial de comandos ejecutados                                  |
| `date`    |                                 | Mostrar la fecha y hora actuales                                             |
|           | `date +%Y-%m-%d %H:%M:%S`       | Mostrar la fecha y hora en formato personalizado                             |
|           | `date +%A`                      | Mostrar el día de la semana                                                  |
|           | `date +%T`                      | Mostrar la hora en formato HH:MM:SS                                          |
|           | `date -s "AAAA-MM-DD HH:MM:SS"` | Establecer la fecha y hora del sistema (requiere permisos de superusuario)   |
| `ps`      | `[opciones]`                    | Mostrar procesos en ejecución                                                |
| `top`     |                                 | Mostrar procesos en tiempo real                                              |
| `htop`    |                                 | Mostrar procesos en tiempo real con interfaz mejorada                        |
| `free`    |                                 | Mostrar el uso de memoria (RAM y swap)                                       |
| `uptime`  |                                 | Mostrar el tiempo de actividad del sistema y la carga media                  |
| `df`      | `[opciones]`                    | Mostrar el uso del espacio en disco                                          |
|           | `df -h`                         | Mostrar el uso del espacio en disco en formato legible                       |
|           | `df -T`                         | Mostrar el tipo de sistema de archivos junto con el uso del espacio en disco |
|           | `df -Th`                        | Mostrar el tipo de sistema de archivos y uso en formato legible (KB, MB, GB) |
| `du`      | `[opciones] [directorio]`       | Mostrar el uso del espacio en disco de un directorio                         |
|           | `du -h`                         | Mostrar el uso del espacio en disco en formato legible                       |
|           | `du -sh`                        | Mostrar el uso total del espacio en disco de un directorio                   |
| `iostat`  | `[opciones]`                    | Mostrar estadísticas de entrada/salida de dispositivos                       |
| `vmstat`  | `[opciones]`                    | Mostrar estadísticas del sistema (memoria, CPU, procesos, etc.)              |

> Ver más comandos informativos relacionados con usuarios y grupos en la sección ["Mostrar información de usuarios y grupos"](mostrar-información-de-usuarios-y-grupos).

## Comandos relacionados con variables de entorno

| Comando    |              | Descripción                                                              |
| ---------- | ------------ | ------------------------------------------------------------------------ |
| `env`      |              | Mostrar todas las variables de entorno                                   |
| `printenv` | `[VARIABLE]` | Mostrar el valor de una variable de entorno específica                   |
| `export`   | `[VARIABLE]` | Exportar una variable de entorno para que esté disponible en subprocesos |
| `set`      | `[opciones]` | Configurar opciones del intérprete de comandos<br>Crear una variable     |
|            | `set -e`     | Salir del script si cualquier comando falla                              |
|            | `set -x`     | Mostrar cada comando antes de ejecutarlo                                 |
| `unset`    | `[VARIABLE]` | Eliminar una variable de entorno                                         |

## Redirrección y pipes

| Redirección | Descripción                                                                    |
| ----------- | ------------------------------------------------------------------------------ |
| `>`         | Redirigir la salida estándar a un fichero (sobrescribiendo su contenido)       |
| `>>`        | Redirigir la salida estándar a un fichero (añadiendo al final del fichero)     |
| `2>`        | Redirigir la salida de errores a un fichero (sobrescribiendo su contenido)     |
| `2>>`       | Redirigir la salida de errores a un fichero (añadiendo al final del fichero)   |
| `&>`        | Redirigir tanto la salida estándar como la de errores a un fichero             |
| `&>>`       | Redirigir tanto la salida estándar como la de errores a un fichero (añadiendo) |
| `<`         | Redirigir la entrada estándar desde un fichero                                 |
| `<<`        | Redirigir la entrada estándar desde un bloque de texto (heredoc)               |
| `\|`        | Encadenar la salida estándar de un comando como entrada estándar de otro       |

### Ejemplos

| Comando                                       | Descripción                                                                                |
| --------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `ls -l > listado.txt`                         | Guardar el listado detallado de archivos en `listado.txt`                                  |
| `ls -l >> listado.txt`                        | Añadir el listado detallado de archivos al final de `listado.txt`                          |
| `$wc < archivo.txt`                           | Contar líneas, palabras y caracteres en `archivo.txt`                                      |
| `$wc < fichero.txt $tr '' '\t' < fichero.txt` | Contar líneas, palabras y caracteres en `fichero.txt` usando tabulaciones como separadores |
| `rev < archivo.txt`                           | Invertir el contenido de cada línea en `archivo.txt`                                       |
| `rev < archivo.txt >> archivo_invertido.txt`  | Invertir el contenido de cada línea y guardarlo en `archivo_invertido.txt`                 |
| `grep "error" logfile.txt 2> errores.txt`     | Buscar "error" en `logfile.txt` y guardar los errores en `errores.txt`                     |

## Trabajar con archivos de texto

| Comando          |                                                                | Descripción                                                                  |
| ---------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `cat`            | `[archivo]`                                                    | **Mostrar contenido** de un archivo                                          |
|                  | `cat archivo1 archivo2`                                        | Concatenar y mostrar el contenido de varios archivos                         |
|                  | `cat archivo1.txt > archivo2.txt`                              | Redirigir el contenido de un archivo a otro                                  |
|                  | `cat archivo1.txt >> archivo2.txt`                             | Añadir contenido al final de un archivo existente                            |
|                  | `cat archivo1 archivo2 > archivo3`                             | Concatenar varios archivos y guardar el resultado en un nuevo archivo        |
| `less`           | `[archivo]`                                                    | Mostrar contenido de un archivo página por página                            |
| `more`           | `[archivo]`                                                    | Mostrar contenido de un archivo página por página (similar a `less`)         |
| `head`           | `[opciones] [archivo]`                                         | Mostrar las primeras líneas de un archivo                                    |
|                  | `head -5 archivo.txt`                                          | Mostrar las primeras 5 líneas de un archivo                                  |
| `tail`           | `[opciones] [archivo]`                                         | Mostrar las últimas líneas de un archivo                                     |
|                  | `tail -5 archivo.txt`                                          | Mostrar las últimas 5 líneas de un archivo                                   |
| `echo`           | `[argumentos]`                                                 | Mostrar argumentos o texto en consola                                        |
| `sort`           | `[opciones] [archivo]`                                         | **Ordenar** las líneas de un archivo de texto                                |
|                  | `sort archivo.txt`                                             | Ordenar las líneas de un archivo en orden alfabético                         |
|                  | `sort -r archivo.txt`                                          | Ordenar las líneas de un archivo en orden inverso                            |
| `uniq`           | `[opciones] [archivo]`                                         | **Eliminar líneas duplicadas** consecutivas en un archivo de texto           |
|                  | `uniq archivo.txt`                                             | Mostrar líneas únicas de un archivo                                          |
|                  | `uniq -c archivo.txt`                                          | **Contar ocurrencias** de líneas únicas en un archivo                        |
| `wc`             | `[opciones] [archivo]`                                         | Contar líneas, palabras y caracteres en un archivo                           |
|                  | `wc -l archivo.txt`                                            | Contar solo las líneas en un archivo                                         |
|                  | `wc -w archivo.txt`                                            | Contar solo las palabras en un archivo                                       |
|                  | `wc -c archivo.txt`                                            | Contar solo los caracteres en un archivo                                     |
| `grep`           | `grep [opciones] patrón [archivo]`<br>`comando \| grep patrón` | **Buscar texto** dentro de un archivo                                        |
|                  | `grep "texto" archivo.txt`                                     | Buscar texto específico en un archivo                                        |
| _(ignore case)_  | `grep -i "texto" archivo.txt`                                  | **Sin distinguir mayúsculas/minúsculas**                                     |
| _(line number)_  | `grep -n "texto" archivo.txt`                                  | Muestra el **número** de línea                                               |
| _(invert match)_ | `grep -v "texto" archivo.txt`                                  | Líneas que **no** contienen el texto                                         |
| _(count)_        | `grep -c "texto" archivo.txt`                                  | Contar el número de líneas que contienen el texto                            |
| _(whole word)_   | `grep -w "palabra" archivo.txt`                                | Buscar coincidencias exactas de una **palabra**                              |
|                  | `grep -E "expresión_regular" archivo.txt`                      | Buscar usando una **expresión regular**                                      |
| _(recursivo)_    | `grep -r "texto" /ruta/del/directorio`                         | Buscar en directorios y subdirectorios de forma recursiva                    |
| _(list files)_   | `grep -l "texto" *.txt`                                        | Listar archivos que contienen el texto                                       |
|                  | `grep -L "texto" *.txt`                                        | Listar archivos que **no** contienen el texto                                |
|                  | `grep -x "línea completa" archivo.txt`                         | Buscar líneas que coincidan exactamente con el texto completo                |
| `paste`          | `[opciones] archivo1 archivo2`                                 | Combinar líneas de archivos lado a lado                                      |
| `cut`            | `[opciones] [archivo]`                                         | **Extraer secciones** específicas de cada línea de un archivo de texto       |
|                  | `cut -c [N \| N-M \| N,M] [archivo]`                           | Extraer caracteres específicos de cada línea de un archivo de texto          |
|                  | `cut -c 5 archivo.txt`                                         | Extraer el quinto carácter de cada línea de un archivo de texto              |
|                  | `cut -c 1-5 archivo.txt`                                       | Extraer los primeros cinco caracteres de cada línea de un archivo            |
|                  | `cut -c 1-5,10-15 archivo.txt`                                 | Extraer los caracteres del 1 al 5 y del 10 al 15 de cada línea de un archivo |
| _(fields)_       | `-f [N \| N-M \| N,M]`                                         | Extraer campos específicos de cada línea de un archivo de texto              |
| _(delimiter)_    | `cut -d ':'`                                                   | Especificar el delimitador de campo (por defecto es tabulación)              |
|                  | `cut -d "," -f1 archivo.csv`                                   | Extraer la primera columna de un archivo CSV (separado por comas)            |
|                  | `cut -d "," -f1-3 archivo.csv`                                 | Extraer las primeras tres columnas de un archivo CSV (separado por comas)    |
|                  | `cut -d ":" -f1 /etc/passwd`                                   | Extraer los nombres de usuario del archivo `/etc/passwd`                     |
|                  | `cut -d ':' -f 1 --complement archivo`                         | Muestra todo menos lo indicado (devuelve todos los campos excepto el 1)      |
| `tar`            | `[opciones] [fichero]`                                         | Crear o extraer archivos tar                                                 |
|                  | `z`                                                            | Comprime el archivo usando gzip                                              |
|                  | `c`                                                            | Crear un nuevo archivo tar                                                   |
|                  | `x`                                                            | Extraer el contenido de un archivo tar                                       |
|                  | `v`                                                            | Modo detallado (muestra el progreso)                                         |
|                  | `f`                                                            | Especificar el nombre del archivo tar                                        |
|                  | `tar cvzf archivo.tar /directorio`                             | Crear un archivo tar desde un directorio                                     |
|                  | `tar xvf archivo.tar ficheros_comprimidos.tgz`                 | Extrae el contenido de un fichero .tgz o .tar.gz (gzip)                      |
|                  | `tar tvf archivo.tar`                                          | Listar el contenido de un fichero .tar                                       |
| `zip`            | `[opciones] [fichero]`                                         | Comprimir archivos o directorios en formato zip                              |
|                  | `zip primer.zip nombre*`                                       | Comprimir todos los archivos con nombre\* en un archivo zip                  |
|                  | `zip -r archivo.zip /directorio`                               | Comprimir un directorio en un archivo zip                                    |
| `gzip`           | `[opciones] [fichero]`                                         | Comprimir archivos usando el algoritmo **gzip**                              |
|                  | `cat file1.txt file2.txt \| gzip > archivo.gz`                 | Comprimir varios archivos en un solo archivo gzip                            |
| `unzip`          | `[opciones] [fichero]`                                         | Extraer archivos de un archivo zip                                           |
|                  | `unzip archivo.zip`                                            | Extraer el contenido de un archivo zip                                       |
| `gunzip`         | `[opciones] [fichero]`                                         | Extraer archivos comprimidos con **gzip**                                    |
| `tr`             | `[opciones] conjunto_caracteres1 conjunto_caracteres_2`        | Traducir o eliminar caracteres en un flujo de texto                          |
|                  | `echo "texto" \| tr [opciones]`                                | Modificar el texto                                                           |
|                  | `echo "texto" \| tr [opciones] > salida.dat`                   | Llevar el resultado a un fichero                                             |
|                  | `tr ' ' '\n' < archivo.txt`                                    | Reemplazar espacios por saltos de línea                                      |
|                  | `tr 'a-z' 'A-Z' < archivo.txt`                                 | Convertir minúsculas a mayúsculas en un archivo de texto                     |
|                  | `tr -d 'aeiou'`                                                | Eliminar vocales                                                             |
|                  | `tr -d 'aeiou' \| tr -d 'AEIOU'`                               | Eliminar vocales mayúsculas y minúsculas                                     |
|                  | `tr -cd '[:alnum:]\n' < archivo.txt`                           | Eliminar todos los caracteres excepto los alfanuméricos y saltos de línea    |
|                  | `tr -s ' ' < archivo.txt`                                      | Reemplazar múltiples espacios consecutivos por un solo espacio               |

### Procesar texto estructurado

| Comando |                                                      | Descripción                                                |
| ------- | ---------------------------------------------------- | ---------------------------------------------------------- |
| `awk`   | `[opciones] 'programa' [archivo]`                    | Procesar y analizar texto estructurado (columnas y filas)  |
|         | `awk '{print $n}' archivo.txt`                       | Mostrar la columna `n` de un archivo de texto              |
|         | `awk '{print $1, $3}' archivo.txt`                   | Mostrar las columnas 1 y 3 de un archivo de texto          |
|         | `ls -l \| awk '{print $1, $9}'`                      | Mostrar permisos y nombres de archivo del listado          |
|         | `-F [delimitador]`                                   | Especificar el delimitador de campos                       |
|         | `awk -F',' '{print $1}' archivo.csv`                 | Usar coma como delimitador y mostrar la primera columna    |
|         | `awk -F: '{print $1}' /etc/passwd`                   | Mostrar los nombres de usuario del archivo `/etc/passwd`   |
|         | `awk -F: '{print $1, $4}' /etc/passwd`               | Mostrar nombres de usuario y GID del archivo `/etc/passwd` |
|         | `awk -F: '$7 == "/bin/bash" {print $1}' /etc/passwd` | Mostrar usuarios con shell bash del archivo `/etc/passwd`  |
|         | `awk -F: '$3 > 1000 {print $1}' /etc/passwd`         | Mostrar usuarios con UID mayor a 1000                      |
|         | `awk -F: '{print NF}' /etc/passwd`                   | Mostrar el número de campos en cada línea del archivo      |

## Comandos para ver ficheros de configuración de usuarios y grupos

| Comando                                  | Descripción                                                                                                                                                                                    |
| ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cat /etc/passwd`                        | Información de usuarios del sistema                                                                                                                                                            |
| `cat /etc/passwd \| grep nombre_usuario` | Información de un usuario específico                                                                                                                                                           |
| `cat /etc/passwd \| cut -d":" -f1`       | Ver solo los nombres de usuario                                                                                                                                                                |
| `less /etc/passwd`                       | Contenido del fichero `/etc/passwd` paginado.                                                                                                                                                  |
| `more /etc/passwd`                       | Contenido del fichero `/etc/passwd` paginado.                                                                                                                                                  |
| `sudo cat /etc/shadow`                   | Contraseñas cifradas. _(solo root)_                                                                                                                                                            |
| `sudo cat /etc/gshadow`                  | Contraseñas de grupos. _(solo root)_ <br>`*`: cuando la cuenta de usuario nunca ha tenido un password<br>`!`: cuando la cuenta está bloqueada (deshabilitada para loguearse mediante password) |
| `sudo cat /etc/group`                    | Información de grupos                                                                                                                                                                          |

## Gestión de usuarios y grupos

### Mostrar información de usuarios y grupos

| Comando                  | Descripción                                                                                                                              |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `whoami`                 | Mostrar el **nombre del usuario** actual                                                                                                 |
| `groups`                 | Mostrar los **grupos** a los que pertenece el **usuario actual**                                                                         |
| `groups usuario`         | Mostrar los **grupos** a los que pertenece **un usuario**                                                                                |
| `id`                     | Mostrar el **UID**, **GID** y **grupos** del usuario actual                                                                              |
| `id -u`                  | Mostrar solo el **UID** del usuario actual                                                                                               |
| `id -un`                 | Mostrar solo el nombre del usuario actual                                                                                                |
| `id -g`                  | Mostrar solo el **GID** del usuario actual                                                                                               |
| `id -gn`                 | Mostrar solo el nombre del grupo primario del usuario actual                                                                             |
| `id -G`                  | Mostrar todos los GID de los grupos a los que pertenece el usuario actual                                                                |
| `id -Gn`                 | Mostrar todos los nombres de los grupos a los que pertenece el usuario actual                                                            |
| `id usuario`             | Mostrar el UID, GID y grupos a los que pertenece un usuario                                                                              |
| `getent group <usuario>` | Mostrar todos los usuarios pertenecientes a un grupo específico                                                                          |
| `ls -l`                  | Verificar permisos, propietario y grupo de ficheros y directorios                                                                        |
| `ls -ltr`                | Listar ficheros y directorios con detalles (permisos, propietario, tamaño), ordenados por fecha de modificación (más recientes al final) |

### Cambiar entre usuarios y obtener privilegios de administrador

| Comando |                      | Descripción                                                                                         |
| ------- | -------------------- | --------------------------------------------------------------------------------------------------- |
| `sudo`  | `[opciones]`         | Ejecutar un comando con privilegios de superusuario                                                 |
|         | `sudo -i`            | Iniciar sesión como usuario **root**<br>Cambiar a usuario **root** (cambiando variables de entorno) |
|         | `sudo su`            | Cambiar al usuario **root** (**sin** cambiar variables de entorno)                                  |
|         | `sudo -u usuario`    | Ejecutar un comando como el usuario especificado                                                    |
|         | `sudo -i -u usuario` | Iniciar sesión como el usuario especificado (cargando variables de entorno)                         |
| `su`    | `[opciones]`         |                                                                                                     |
|         | `su -`               | Cambiar al usuario **root** (con **contraseña** establecida)                                        |
|         | `su usuario`         | Cambiar al usuario especificado (manteniendo variables de entorno)                                  |
|         | `su - usuario`       | Cambiar de usuario especificado sin heredar variables de entorno                                    |

### Creación y eliminación de usuarios y grupos

| Comando                                                           | Descripción                                                                                            |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `useradd <usuario>`                                               | **Crear un nuevo usuario**                                                                             |
| `useradd <usuario> <grupo>`                                       | Crear un nuevo usuario asignado a un grupo                                                             |
| `useradd <usuario> -u 1010 -g <grupo>`                            | Crear un nuevo usuario con un UID específico                                                           |
| `useradd -g <grupo> -d /home/<usuario> -m -s /bin/bash <usuario>` | Crear un nuevo usuario asignado a un grupo, con directorio personal y shell bash                       |
| `userdel <usuario>`                                               | **Eliminar un usuario**                                                                                |
| `userdel -r <usuario>`                                            | Eliminar un usuario y su directorio home                                                               |
| `deluser <usuario>`                                               | **Eliminar un usuario**. Script de alto nivel (típico de Debian/Ubuntu) que usa internamente `userdel` |
| `groupadd <grupo>`                                                | **Crear un nuevo grupo** de usuarios                                                                   |
| `groupadd -g <GID> <grupo>`                                       | Crear un grupo y asignarle un GID específico                                                           |
| `groupdel <grupo>`                                                | **Eliminar un grupo** de usuarios                                                                      |

### Modificaciones en usuarios y grupos

| Comando                                   |           | Descripción                                                                            |
| ----------------------------------------- | --------- | -------------------------------------------------------------------------------------- |
| `usermod <usuario>`                       |           | Modificar la configuración de un usuario                                               |
| `usermod -d <nuevo_directorio> <usuario>` | _dir_     | Cambiar el directorio home de un usuario                                               |
| `usermod -l <nuevo_usuario> <usuario>`    |           | Renombrar un usuario                                                                   |
| `usermod -L <usuario>`                    | _Lock_    | **Bloquear** la cuenta de un usuario _(no podrá iniciar sesión)_                       |
| `usermod -U <usuario>`                    | _Unlock_  | **Desbloquear** la cuenta de un usuario                                                |
| `usermod -u <nuevo_UID> <usuario>`        | _uid_     | Cambiar el UID de un usuario                                                           |
| `usermod -g <nuevo_grupo> <usuario>`      | _group_   | Cambiar el grupo primario de un usuario                                                |
| `usermod -aG <grupo> <usuario>`           | _append_  | **Añadir un usuario a un grupo secundario**                                            |
| `usermod -s /bin/zsh <usuario>`           | _shell_   | Cambiar la shell de un usuario                                                         |
| `usermod -e <AAAA-MM-DD> <usuario>`       | _expire_  | Establecer una fecha de expiración para la cuenta de un usuario                        |
| `usermod -c "Info adicional" <usuario>`   | _comment_ | Agregar información adicional a la cuenta de un usuario (nombre completo, teléfono...) |
| `groupmod <grupo>`                        |           | Modificar la configuración de un grupo                                                 |
| `groupmod -n <nuevo_grupo> <grupo>`       | _name_    | Renombrar un grupo de usuarios                                                         |
| `groupmod -d <nuevo_directorio> <grupo>`  | _dir_     | Cambiar el directorio home asociado a un grupo de usuarios                             |
| `newgrp <grupo>`                          |           | Cambiar el grupo primario del usuario actual. _(pedirá la contraseña)_                 |

### Gestión de contraseñas

| Comando            |                                 | Descripción                                                                            |
| ------------------ | ------------------------------- | -------------------------------------------------------------------------------------- |
| `passwd <usuario>` |                                 | Cambiar la contraseña de un usuario (se deben tener permisos de sudo o ser el usuario) |
| `gpasswd <grupo>`  | `[opciones]`                    | Administrar contraseñas y miembros de grupos.                                          |
|                    | `gpasswd -r <grupo>`            | Eliminar la contraseña de un grupo.                                                    |
| `chage <usuario>`  | `[opciones]`                    | Modificar la información de expiración de la contraseña y cuenta.                      |
|                    | `chage -l <usuario>`            | Mostrar la información de expiración de la contraseña y cuenta de un usuario.          |
|                    | `chage -E AAAA-MM-DD <usuario>` | Establecer la fecha de expiración de la cuenta de un usuario.                          |

### Gestión de permisos

| Comando |                                  | Descripción                                                                                                                        |
| ------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `chmod` | `[opciones]`                     | Cambiar los **permisos** de ficheros y directorios _(change mode)_                                                                 |
|         | `chmod [permisos] fichero`       | Cambiar los permisos de un fichero o directorio                                                                                    |
|         | `chmod -R [permisos] directorio` | Cambiar los permisos de forma recursiva en un directorio y todo su contenido                                                       |
| `chown` | `[opciones]`                     | Cambiar el **propietario** y **grupo** de ficheros y directorios _(change owner)_                                                  |
|         | `chown usuario fichero`          | Cambiar solo el **propietario** de un fichero o directorio                                                                         |
|         | `chown usuario:grupo fichero`    | Cambiar el **propietario** y **grupo** de un fichero o directorio                                                                  |
| `umask` | `[opciones]`                     | Mostrar o establecer la **máscara de permisos** por defecto para nuevos ficheros y directorios                                     |
|         | `umask -S`                       | Establecer máscara de permisos por defecto para nuevos ficheros y directorios en formato simbólico                                 |
|         | `umask -S 027`                   | Establecer máscara de permisos por defecto para nuevos ficheros y directorios a `750` (prop: r, w, x; grupo: r, x; otros: ninguno) |

**Permisos para ficheros y directorios:**

| Permiso | Descripción                              |
| ------- | ---------------------------------------- |
| `r`     | Permiso de lectura (read)                |
| `w`     | Permiso de escritura (write)             |
| `x`     | Permiso de ejecución (execute)           |
| `s`     | Set User ID (SUID) o Set Group ID (SGID) |
| `t`     | Sticky bit                               |

**Máscara de permisos (umask):**

| Máscara | Permisos resultantes para nuevos ficheros y directorios     |
| ------- | ----------------------------------------------------------- |
| `000`   | ficheros: `666` (rw-rw-rw-), directorios: `777` (rwxrwxrwx) |
| `022`   | ficheros: `644` (rw-r--r--), directorios: `755` (rwxr-xr-x) |
| `027`   | ficheros: `640` (rw-r-----), directorios: `750` (rwxr-x---) |
| `077`   | ficheros: `600` (rw-------), directorios: `700` (rwx------) |

**Permisos especiales:**

| Permiso    |                | Descripción                                                                                               |
| ---------- | -------------- | --------------------------------------------------------------------------------------------------------- |
| **SUID**   | _Set User ID_  | Permite ejecutar un fichero con los **permisos del propietario** del fichero (usado en ejecutables).      |
| **SGID**   | _Set Group ID_ | Permite ejecutar un fichero con los **permisos del grupo** del fichero o heredar el grupo en directorios. |
| **Sticky** | _Sticky bit_   | En **directorios**, solo el **propietario** de un fichero puede borrarlo o renombrarlo.                   |

**Ejemplos de uso del comando `chmod`:**

| Comando                              | Descripción                                                                                                                              |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `chmod u+rwx,g+rx,o-rwx fichero.txt` | Establecer permisos de lectura, escritura y ejecución para el propietario; lectura y ejecución para el grupo; ningún permiso para otros. |
| `chmod -x fichero.txt`               | Quitar el permiso de ejecución para todos (propietario, grupo y otros).                                                                  |
| `chmod o+r+w fichero.txt`            | Dar permisos de lectura y escritura a otros usuarios.                                                                                    |
| `chmod u+s fichero.txt`              | Establecer el bit **SUID** en un fichero (ejecución con permisos del propietario).                                                       |
| `chmod u-s fichero.txt`              | Quitar el bit **SUID** de un fichero.                                                                                                    |
| `chmod g+s fichero.txt`              | Establecer el bit **SGID** en un fichero o directorio (ejecución con permisos del grupo).                                                |
| `chmod g-s <carpeta_compartida>`     | Quitar el bit **SGID** de un fichero o directorio.                                                                                       |
| `chmod o+t <carpeta_temporal>`       | Establecer el bit **sticky** en un directorio (solo el propietario de un fichero dentro del directorio puede borrarlo).                  |
| `chmod o-t <carpeta_temporal>`       | Quitar el bit **sticky** de un directorio.                                                                                               |

**Permisos (octal y binario):**

| Permisos (octal) | Permisos (binario) | Significado                          |
| ---------------- | ------------------ | ------------------------------------ |
| `7`              | `111`              | lectura, escritura y ejecución (rwx) |
| `6`              | `110`              | lectura y escritura (rw-)            |
| `5`              | `101`              | lectura y ejecución (r-x)            |
| `4`              | `100`              | solo lectura (r--)                   |
| `3`              | `011`              | escritura y ejecución (-wx)          |
| `2`              | `010`              | solo escritura (-w-)                 |
| `1`              | `001`              | solo ejecución (--x)                 |
| `0`              | `000`              | sin permisos (---)                   |

**Ejemplos de permisos comunes en formato octal y simbólico:**

| Permisos (octal) | Permisos (simbólico) | Descripción                                                                       |
| ---------------- | -------------------- | --------------------------------------------------------------------------------- |
| `777`            | `rwxrwxrwx`          | Permisos completos para propietario, grupo y otros                                |
| `775`            | `rwxrwxr-x`          | Permisos completos para propietario y grupo; lectura y ejecución para otros       |
| `755`            | `rwxr-xr-x`          | Permisos completos para propietario; lectura y ejecución para grupo y otros       |
| `711`            | `rwx--x--x`          | Permisos completos para el propietario; solo ejecución para grupo y otros         |
| `700`            | `rwx------`          | Permisos completos solo para el propietario                                       |
| `666`            | `rw-rw-rw-`          | Permisos de lectura y escritura para propietario, grupo y otros                   |
| `644`            | `rw-r--r--`          | Permisos de lectura y escritura para propietario; solo lectura para grupo y otros |
| `640`            | `rw-r-----`          | Permisos de lectura y escritura solo para el propietario; solo lectura para grupo |
| `600`            | `rw-------`          | Permisos de lectura y escritura solo para el propietario                          |
| `444`            | `r--r--r--`          | Permisos de solo lectura para propietario, grupo y otros                          |
| `400`            | `r--------`          | Permisos de solo lectura solo para el propietario                                 |

## Comandos de red

| Comando      |                                                        | Descripción                                                                                                                                         |
| ------------ | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `hostname`   | `[opciones]`                                           | Nombre del **host** del sistema                                                                                                                     |
|              | `hostname -i`                                          | **Dirección IP** asociada al nombre del host _(cómo se traduce el hostname a una IP)_. Depende de `/etc/hosts` y DNS                                |
|              | `hostname -I`                                          | Devuelve todas las **IPs reales** asignadas a las interfaces de red _(no depende del hostname)_. Puede haber varias (Ethernet, Wi-Fi, VPN, Docker…) |
|              | `sudo hostname nuevo_nombre`                           | Cambiar el nombre del host del sistema (requiere reinicio o reinicio del servicio de red para aplicar el cambio)                                    |
| `ifconfig`   |                                                        | Mostrar o configurar interfaces de red                                                                                                              |
|              | `sudo ifconfig [interfaz] [opciones]`                  | **Configurar** parámetros de la interfaz de red (IP, máscara, etc.)                                                                                 |
|              | _ejemplo: `sudo ifconfig eth0 promisc`_                | Poner la interfaz `eth0` en modo promiscuo (captura todo el tráfico de red)                                                                         |
|              | `ifconfig wlan0 up`                                    | Activar la interfaz inalámbrica `wlan0`                                                                                                             |
|              | `sudo ifconfig eht0 192.168.0.2 netmask 255.255.255.0` | Asignar una IP estática a la interfaz `eth0`                                                                                                        |
| `iwconfig`   |                                                        | Mostrar o configurar interfaces de red inalámbricas (Wi-Fi)                                                                                         |
|              | `sudo iwconfig [interfaz] [opciones]`                  | **Configurar** parámetros de la interfaz inalámbrica (SSID, canal, modo, etc.)                                                                      |
| `iwlist`     |                                                        | Mostrar información detallada de las interfaces inalámbricas                                                                                        |
|              | `sudo iwlist [interfaz] scan` _(ej: wlan0)_            | Escanear redes inalámbricas disponibles                                                                                                             |
| `ifup`       | `[interfaz]`                                           | Activar una interfaz de red                                                                                                                         |
| `ifdown`     | `[interfaz]`                                           | Desactivar una interfaz de red                                                                                                                      |
| `ip`         | `[interfaz]`                                           | Mostrar o configurar parámetros de la interfaz de red                                                                                               |
|              | `[opciones]`                                           | Mostrar o manipular el enrutamiento, dispositivos y túneles de red                                                                                  |
|              | `ip addr` o `ip a`                                     | Mostrar direcciones IP asignadas a las interfaces de red                                                                                            |
|              | `ip -s l`                                              | Estadísticas de transmisión (TX) y recepción (RX) de interfaz IP, y el nº de paquetes transmitidos y recibidos                                      |
|              | `ip link show` o `ip l s`                              | Mostrar el estado de las interfaces de red del sistema                                                                                              |
|              | `ip address show dev eth0`                             | Mostrar la configuración detallada de la interfaz `eth0`                                                                                            |
|              | `ip route show`                                        | Mostrar la tabla de enrutamiento IP                                                                                                                 |
| `ping`       | `[opciones] [host]`                                    | Comprobar la conectividad con otro host                                                                                                             |
|              | `ping -c 4 google.com`                                 | Enviar 4 paquetes ICMP a google.com y mostrar el resultado                                                                                          |
| `curl`       | `[opciones] URL`                                       | Transferir datos desde o hacia un servidor                                                                                                          |
| `wget`       | `[opciones] URL`                                       | Descargar archivos de la web                                                                                                                        |
| `nmcli`      | `[opciones]`                                           | Herramienta de línea de comandos para gestionar NetworkManager                                                                                      |
|              | `nmcli dev show`                                       | Mostrar el estado detallado de los dispositivos de red (interfaz, tipo, estado...)                                                                  |
|              | `nmcli dev show \| grep DNS`                           | Mostrar solo la configuración DNS de los dispositivos de red                                                                                        |
| `traceroute` | `[opciones] [host]`                                    | Rastrear la ruta que siguen los paquetes hasta un host. _(`sudo apt install traceroute`)_                                                           |
|              | `*` _(en la salida)_                                   | Indica que no se ha recibido respuesta de ese salto (timeout)                                                                                       |
|              | `traceroute -I google.com`                             | Rastrear la ruta usando paquetes ICMP en lugar de UDP                                                                                               |
|              | `traceroute -I -q 1 google.com`                        | Rastrear la ruta usando paquetes ICMP con solo 1 consulta por salto _(por defecto son 3)_                                                           |
|              | `traceroute -m 15 google.com`                          | Establecer el número máximo de saltos a 15 _(por defecto son 30)_                                                                                   |
|              | `traceroute -n google.com`                             | Rastrear la ruta sin resolver nombres de dominio (muestra solo IPs) _(funciona más rápido)_                                                         |
|              | `traceroute -g  <gateway1>,<gateway2> <host>`          | Rastrear la ruta especificando gateways intermedios (source routing)                                                                                |
|              | `traceroute -T google.com`                             | Rastrear la ruta usando paquetes TCP en lugar de UDP                                                                                                |
| `route`      | `[opciones]`                                           | Mostrar o manipular la tabla de enrutamiento IP _(`sudo apt install net-tools`)_                                                                    |
|              | `route -n`                                             | Mostrar tabla de enrutamiento sin resolver nombres de dominio (muestra solo IPs)                                                                    |
|              | `route -e`                                             | Mostrar tabla de enrutamiento con información extendida                                                                                             |
|              | `sudo route add -net 127.0.0.0 netmask 255.0.0.0 lo`   | **Añadir** una ruta estática a la tabla de enrutamiento                                                                                             |
|              | `sudo route del -net 127.0.0.0 netmask 255.0.0.0 lo`   | **Eliminar** una ruta estática de la tabla de enrutamiento                                                                                          |
| `netstat`    | `[opciones]`                                           | Mostrar conexiones de red, tablas de enrutamiento, estadísticas de interfaz, etc. _(`sudo apt install net-tools`)_                                  |
|              | `netstat -natu`                                        | Mostrar todas las conexiones activas (TCP y UDP) sin resolver nombres de dominio (muestra solo IPs)                                                 |
|              | `netstat -natu \| grep ESTABLISHED` _(o ESTABLECIDO)_  | Mostrar solo las conexiones activas en estado ESTABLECIDO                                                                                           |
|              | `netstat -s`                                           | Mostrar estadísticas detalladas de protocolos de red                                                                                                |
|              | `netstat -an`                                          | Mostrar todas las conexiones y puertos en escucha sin resolver nombres de dominio (muestra solo IPs)                                                |
|              | `netstat -an \| grep LISTEN` _(o ESCUCHANDO)_          | Mostrar solo los puertos en estado de escucha                                                                                                       |
|              | `netstat -anlp \| grep 3682`                           | Mostrar el proceso que está usando el puerto 3682                                                                                                   |
|              | `netstat -anlp \| grep 80 \| grep LISTEN`              | Mostrar el proceso que está usando el puerto 80 en estado de escucha                                                                                |
|              | `netstat -i`                                           | Mostrar estadísticas de las interfaces de red                                                                                                       |
| `nslookup`   | `[opciones] [dominio]`                                 | Consultar servidores DNS para obtener información de un dominio                                                                                     |
|              | `nslookup www.google.com`                              | Obtener la dirección IP asociada al dominio www.google.com                                                                                          |
|              | `nslookup 209.132.183.181`                             | Obtener el nombre de dominio asociado a la IP                                                                                                       |
|              | `nslookup -debug www.google.com`                       | Obtener información detallada de la consulta DNS                                                                                                    |
| `arp`        | `[opciones]`                                           | Mostrar o manipular la caché ARP **_(Address Resolution Protocol - Protocolo de Resolución de Direcciones)_**                                       |
|              | `arp -a`                                               | Mostrar la tabla ARP completa                                                                                                                       |
|              | `arp -n`                                               | Mostrar la tabla ARP sin resolver nombres de dominio (muestra solo IPs)                                                                             |
|              | `arp -i <interfaz>` (ej: eth0)                         | Mostrar la tabla ARP de una interfaz específica                                                                                                     |
|              | `arp -s <IP> <MAC>`                                    | Añadir una entrada estática a la tabla ARP                                                                                                          |
|              | `arp -d <IP>`                                          | Eliminar una entrada de la tabla ARP                                                                                                                |
| `nmap`       | `[opciones] [host]`                                    | Escanear puertos y servicios en un host remoto _(`sudo apt install nmap`)_                                                                          |
|              | `nmap 10.0.2.15`                                       | Escanear los puertos más comunes en el host con IP                                                                                                  |
|              | `nmap -sn 10.0.2.0/24`                                 | Escanear la red local para descubrir hosts activos (ping scan)                                                                                      |
|              | `sudo nmap 10.0.2.15 -O`                               | Escanear el host remoto para detectar el sistema operativo                                                                                          |
| `iPerf`      | `[opciones]`                                           | Medir el ancho de banda de la red entre dos hosts _(`sudo apt install iperf3`)_                                                                     |
| `tcpdump`    | `[opciones]`                                           | Capturar y analizar paquetes de red _(`sudo apt install tcpdump`)_                                                                                  |
|              | `sudo tcpdump -i eth0`                                 | Capturar paquetes en la interfaz `eth0`                                                                                                             |
|              | `sudo tcpdump -i eth0 tcp`                             | Capturar solo paquetes TCP en la interfaz `eth0`                                                                                                    |
|              | `sudo tcpdump -i eth0 tcp -A`                          | Capturar paquetes TCP en la interfaz `eth0` y mostrar el contenido en ASCII                                                                         |
|              | `sudo tcpdump -i eth0 udp`                             | Capturar solo paquetes UDP en la interfaz `eth0`                                                                                                    |
|              | `sudo tcpdump -i eth0 icmp`                            | Capturar solo paquetes ICMP en la interfaz `eth0`                                                                                                   |
|              | `sudo tcpdump -i eth0 -c 100`                          | Capturar 100 paquetes en la interfaz `eth0`                                                                                                         |
|              | `sudo tcpdump -i eth0 port 80`                         | Capturar paquetes HTTP (puerto 80) en la interfaz `eth0`                                                                                            |
|              | `sudo tcpdump -i eth0 -w captura.pcap`                 | Capturar paquetes y guardarlos en un archivo `captura.pcap`                                                                                         |
|              | Agrupar condiciones: `and`, `or`, `not`                |                                                                                                                                                     |
|              | `sudo tcpdump -i eth0 tcp and port 80`                 | Capturar paquetes TCP en el puerto 80 en la interfaz `eth0`                                                                                         |
|              | `sudo tcpdump -i eth0 tcp or udp`                      | Capturar paquetes TCP o UDP en la interfaz `eth0`                                                                                                   |
|              | `sudo tcpdump -i eth0 not icmp`                        | Capturar todos los paquetes excepto ICMP en la interfaz `eth0`                                                                                      |
|              | `sudo tcpdump -i eth0 tcp and (port 80 or port 443)`   | Capturar paquetes TCP en los puertos 80 o 443 en la interfaz `eth0`                                                                                 |

### Bits y cálculos de direcciones IP

| 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 128 | 64  | 32  | 16  | 8   | 4   | 2   | 1   |

### Clases de redes IP

| Clase | Prefijo (1º byte) | Máscara de subred CIDR | Máscara de subred | Uso típico                          |
| ----- | ----------------- | ---------------------- | ----------------- | ----------------------------------- |
| A     | 0-127             | `/8`                   | `255.0.0.0`       | Redes muy grandes (pocos en número) |
| B     | 128-191           | `/16`                  | `255.255.0.0`     | Redes medianas                      |
| C     | 192-223           | `/24`                  | `255.255.255.0`   | Redes pequeñas                      |

### Máscaras de red

| Notación CIDR | Máscara de subred   | Nº de bits para red | Nº de bits para host | Nº máximo de hosts | Binario                             |
| ------------- | ------------------- | ------------------- | -------------------- | ------------------ | ----------------------------------- |
| `/8`          | `255.0.0.0`         | 8                   | 24                   | 16,777,214         | 11111111.00000000.00000000.00000000 |
| `/9`          | `255.128.0.0`       | 9                   | 23                   | 8,190,382          | 11111111.10000000.00000000.00000000 |
| `/10`         | `255.192.0.0`       | 10                  | 22                   | 4,094,766          | 11111111.11000000.00000000.00000000 |
| `/11`         | `255.224.0.0`       | 11                  | 21                   | 2,046,382          | 11111111.11100000.00000000.00000000 |
| `/12`         | `255.240.0.0`       | 12                  | 20                   | 1,022,766          | 11111111.11110000.00000000.00000000 |
| `/13`         | `255.248.0.0`       | 13                  | 19                   | 524,286            | 11111111.11111000.00000000.00000000 |
| `/14`         | `255.252.0.0`       | 14                  | 18                   | 262,142            | 11111111.11111100.00000000.00000000 |
| `/16`         | `255.255.0.0`       | 16                  | 16                   | 65,534             | 11111111.11111111.00000000.00000000 |
| `/17`         | `255.255.128.0`     | 17                  | 15                   | 32,766             | 11111111.11111111.10000000.00000000 |
| `/18`         | `255.255.192.0`     | 18                  | 14                   | 16,382             | 11111111.11111111.11000000.00000000 |
| `/19`         | `255.255.224.0`     | 19                  | 13                   | 8,190              | 11111111.11111111.11100000.00000000 |
| `/20`         | `255.255.240.0`     | 20                  | 12                   | 4,094              | 11111111.11111111.11110000.00000000 |
| `/21`         | `255.255.248.0`     | 21                  | 11                   | 2,046              | 11111111.11111111.11111000.00000000 |
| `/22`         | `255.255.252.0`     | 22                  | 10                   | 1,022              | 11111111.11111111.11111100.00000000 |
| `/23`         | `255.255.254.0`     | 23                  | 9                    | 510                | 11111111.11111111.11111110.00000000 |
| **`/24`**     | **`255.255.255.0`** | 24                  | 8                    | **254**            | 11111111.11111111.11111111.00000000 |
| `/25`         | `255.255.255.128`   | 25                  | 7                    | 126                | 11111111.11111111.11111111.10000000 |
| `/26`         | `255.255.255.192`   | 26                  | 6                    | 62                 | 11111111.11111111.11111111.11000000 |
| `/27`         | `255.255.255.224`   | 27                  | 5                    | 30                 | 11111111.11111111.11111111.11100000 |
| `/28`         | `255.255.255.240`   | 28                  | 4                    | 14                 | 11111111.11111111.11111111.11110000 |
| `/29`         | `255.255.255.248`   | 29                  | 3                    | 6                  | 11111111.11111111.11111111.11111000 |
| `/30`         | `255.255.255.252`   | 30                  | 2                    | 2                  | 11111111.11111111.11111111.11111100 |
| `/31`         | `255.255.255.254`   | 31                  | 1                    | 0                  | 11111111.11111111.11111111.11111110 |
| `/32`         | `255.255.255.255`   | 32                  | 0                    | 0                  | 11111111.11111111.11111111.11111111 |

### Cálculo de subredes

| Fórmula                                                 | Descripción                                                                  |
| ------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `2^n >= número de subredes`                             | Calcular el número de bits necesarios para subredes (n = bits para subredes) |
| `2^m - 2 >= número de hosts por subred`                 | Calcular el número de bits necesarios para hosts (m = bits para hosts)       |
| `Nueva máscara = máscara original + bits para subredes` | Calcular la nueva máscara de subred después de subnetting                    |

### Dividir en 'n' subredes

- Paso 1: Calcular bits necesarios: `n` donde `2^n >= número de subredes` -> Necesitamos 'n' bits para subredes
- Paso 2: Calcular nueva máscara: Nueva máscara = máscara original + n (ejemplo: `/24 + 3 = /27`).
  - Pasar a notación decimal punteada si es necesario (ejemplo: `/27 = 255.255.255.224`)
- Paso 3: Calcular el salto entre subredes:
  - Bits restantes para host: `m = 32 - nueva máscara` (ejemplo: `32 - 27 = 5`)
  - Salto = `2^m` (ejemplo: `2^5 = 32`). Las subredes se incrementan de 32 en 32.
- Paso 4: Listar subredes:
  - Empezar desde 0 y sumar el salto hasta llegar a 256 en el octeto correspondiente.
  - Ejemplo con `/27` (máscara `255.255.255.224`):
    - Subred 1: `0` (rango: `0-31`, rango host: `1-30`, broadcast: `31`)
    - Subred 2: `32` (rango: `32-63`, rango host: `33-62`, broadcast: `63`)
    - Subred 3: `64` (rango: `64-95`, rango host: `65-94`, broadcast: `95`)
    - Subred 4: `96` (rango: `96-127`, rango host: `97-126`, broadcast: `127`)
    - Subred 5: `128` (rango: `128-159`, rango host: `129-158`, broadcast: `159`)
    - Subred 6: `160` (rango: `160-191`, rango host: `161-190`, broadcast: `191`)
    - Subred 7: `192` (rango: `192-223`, rango host: `193-222`, broadcast: `223`)
    - Subred 8: `224` (rango: `224-255`, rango host: `225-254`, broadcast: `255`)
- Paso 5: Calcular hosts por subred:
  - Hosts por subred = `2^m - 2` (ejemplo: `2^5 - 2 = 30` hosts por subred)

## Comandos de procesos

| Comando  |                                               | Descripción                                                          |
| -------- | --------------------------------------------- | -------------------------------------------------------------------- |
| `ps`     | `[opciones]`                                  | Mostrar procesos en ejecución                                        |
|          | `ps -l`                                       | Muestra una lista larga con más detalles                             |
|          | `ps -f`                                       | Muestra una lista completa con detalles adicionales                  |
|          | `ps -l`                                       | Muestra una lista larga con más detalles                             |
|          | `ps -a`                                       | Muestra procesos de todos los usuarios en la terminal actual         |
|          | `ps -u nombre_usuario`                        | Muestra procesos del usuario especificado                            |
|          | `ps -U nombre_usuario`                        | Muestra procesos del usuario especificado y sus hijos                |
|          | `ps -C nombre_proceso`                        | Muestra procesos por nombre de comando                               |
|          | `ps -x`                                       | Muestra procesos sin terminal asociado                               |
|          | `ps -p PID`                                   | Muestra información del proceso con el PID especificado              |
|          | `ps -o pid,ppid,cmd,%mem,%cpu`                | Muestra columnas específicas                                         |
|          | `ps -eo pid,ppid,cmd,%mem,%cpu`               | Muestra columnas específicas                                         |
|          | `ps -eo pid,ppid,cmd,%mem,%cpu --sort==-%mem` | Muestra columnas específicas ordenadas por uso de memoria            |
|          | `ps -ef`                                      | Muestra todos los procesos en formato completo                       |
|          | `ps -ef \| less`                              | Muestra todos los procesos con paginación                            |
|          | `ps aux`                                      | Muestra todos los procesos con detalles adicionales                  |
|          | `ps aux --sort -pcpu`                         | Ordena los procesos por uso de CPU                                   |
|          | `ps aux --sort -pmem`                         | Ordena los procesos por uso de memoria                               |
|          | `ps aux --sort -pcpu,+pmem`                   | Ordena los procesos por uso de CPU y memoria                         |
|          | `ps aux \| grep nombre_usuario`               | Filtra procesos por nombre de usuario                                |
|          | `ps aux \| grep ' R '`                        | Muestra procesos en estado 'Ejecutando o listo para ejecutarse'      |
|          | `ps aux \| grep ' S '`                        | Muestra procesos en estado 'Suspendido (sleeping)'                   |
|          | `ps aux \| awk '{print $1, $2, $3, $4, $11}'` | Muestra usuario, PID, uso de CPU, uso de memoria y comando           |
|          | `ps aux \| awk '$8=="R" {print $0}'`          | Muestra solo procesos en estado 'Ejecutando o listo para ejecutarse' |
| `pgrep`  | `[opciones] nombre_proceso`                   | Buscar procesos por nombre                                           |
|          | `pgrep -u nombre_usuario nombre_proceso`      | Buscar procesos por nombre de usuario y nombre de proceso            |
| `pstree` | `[opciones] [PID]`                            | Mostrar árbol de procesos                                            |
|          | `pstree -p`                                   | Mostrar árbol de procesos con PIDs                                   |
|          | `pstree -u`                                   | Mostrar árbol de procesos con nombres de usuario                     |
| `uptime` |                                               | Muestra el tiempo de actividad del sistema y la carga media          |
| `top`    | `[opciones]`                                  | Mostrar procesos en tiempo real                                      |
|          | `top -u nombre_usuario`                       | Mostrar procesos de un usuario específico                            |
| `htop`   |                                               | Mostrar procesos en tiempo real con interfaz mejorada                |
| `kill`   | `[PID]`                                       | Terminar un proceso por su ID                                        |
|          | `kill -9 PID`                                 | Forzar la terminación de un proceso (SIGKILL)                        |
|          | `kill -15 PID`                                | Terminar un proceso de forma segura (SIGTERM)                        |

### Gestión de memoria

| Comando                             | Descripción                                             |
| ----------------------------------- | ------------------------------------------------------- |
| `free`                              | Mostrar el uso de memoria y swap                        |
| `free -h`                           | Mostrar el uso de memoria y swap en formato legible     |
| `free --kilo`                       | Mostrar el uso de memoria y swap en kilobytes           |
| `free --mega`                       | Mostrar el uso de memoria y swap en megabytes           |
| `free --giga`                       | Mostrar el uso de memoria y swap en gigabytes           |
| `free -b`                           | Mostrar el uso de memoria y swap en bytes               |
| `free -k`                           | Mostrar el uso de memoria y swap en kilobytes           |
| `free -m`                           | Mostrar el uso de memoria y swap en megabytes           |
| `free -g`                           | Mostrar el uso de memoria y swap en gigabytes           |
| `free -h`                           | Mostrar el uso de memoria y swap en formato legible     |
| `free -s5`                          | Actualizar el uso de memoria y swap cada 5 segundos     |
| `vmstat`                            | Proporcionar estadísticas detalladas de memoria         |
| `cat /proc/meminfo`                 | Mostrar información detallada de la memoria del sistema |
| `cat /proc/meminfo \| grep MemFree` | Mostrar solo la memoria libre del sistema               |
| `swapon`                            | Activar espacio de intercambio (swap)                   |
| `swapon -s`                         | Mostrar el estado del espacio de intercambio (swap)     |
| `swapoff`                           | Desactivar espacio de intercambio (swap)                |
| `vmstat`                            | Proporcionar estadísticas detalladas de memoria         |
| `vmstat -s`                         | Mostrar el uso de memoria y swap en bloques             |

### Estados de procesos

| Símbolo | Descripción                                                                                                      |
| ------- | ---------------------------------------------------------------------------------------------------------------- |
| `I`     | Inactivo (idle) _(durmiendo durante más de unos 20 segundos; esperando un evento para pasar a ejecutarse)_       |
| `R`     | Ejecutando o listo para ejecutarse                                                                               |
| `S`     | Suspendido (sleeping) _(pausa interrumpible; espera que se complete un evento)_                                  |
| `T`     | Detenido (stopped) _(esperando algún recurso del sistema)_                                                       |
| `U`     | Proceso en espera ininterrumpida _(uninterruptible)_                                                             |
| `Z`     | Zombie _(terminado pero esperando a ser recogido; su proceso padre sigue vivo y no ha detectado su terminación)_ |
| `+`     | Proceso en primer plano _(foreground)_                                                                           |
| `s`     | Proceso es un líder de sesión                                                                                    |
| `<`     | Proceso tiene alta prioridad                                                                                     |
| `N`     | Proceso tiene baja prioridad                                                                                     |

### Administracioón de servicios

| Comando                                               | Descripción                                                           |
| ----------------------------------------------------- | --------------------------------------------------------------------- |
| `systemctl start`                                     | Iniciar un servicio                                                   |
| `systemctl stop`                                      | Detener un servicio                                                   |
| `systemctl restart`                                   | Reiniciar un servicio                                                 |
| `systemctl reload`                                    | Recargar la configuración de un servicio sin reiniciarlo              |
| `systemctl status`                                    | Mostrar el estado de un servicio                                      |
| `systemctl enable`                                    | Habilitar un servicio para que se inicie al arrancar el sistema       |
| `systemctl disable`                                   | Deshabilitar un servicio para que no se inicie al arrancar el sistema |
| `sudo systemctl list-unit-files --type=service --all` | Listar todos los servicios y su estado de habilitación                |
| `sudo systemctl \| grep running`                      | Listar todos los servicios que están actualmente en ejecución         |
| `sudo systemctl status nombre_servicio`               | Mostrar el estado detallado de un servicio específico                 |

## Programación en shell

### Metacaracteres y caracteres especiales

| Símbolo | Descripción                                                                                                            |
| ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `~`     | Representa el **directorio home** del usuario actual                                                                   |
| `.`     | Representa el **directorio actual**                                                                                    |
| `..`    | Representa el **directorio padre** del directorio actual                                                               |
| `$`     | **Valor de variable**                                                                                                  |
| `#`     | **Comentario**                                                                                                         |
| `\`     | Carácter de **escape** para interpretar el siguiente carácter literalmente                                             |
| `*`     | Comodín que representa **cero o más caracteres** en nombres de archivos                                                |
| `?`     | Comodín que representa **un solo carácter** en nombres de archivos                                                     |
| `!`     | Negación en expresiones condicionales                                                                                  |
| `\|`    | **Pipe** para redirigir la salida de un comando como entrada de otro comando                                           |
| `''`    | Comillas simples: interpretar el texto **literalmente** (sin expansión de variables ni caracteres especiales)          |
| `""`    | Comillas dobles: interpretar el texto con **expansión de variables** y algunos caracteres especiales                   |
| `()`    | Agrupación de comandos o subprocesos                                                                                   |
| `[ ]`   | Conjunto de caracteres que representa uno de los caracteres especificados                                              |
| `{ }`   | Grupo de opciones que permite elegir entre varias alternativas                                                         |
| `;`     | Separador de comandos para ejecutar varios comandos en una sola línea                                                  |
| `&`     | Ejecutar un comando en segundo plano. _Proceso o comando en background_                                                |
| `&&`    | Ejecutar el segundo comando solo si el primero se ejecuta correctamente                                                |
| `>`     | Redirigir la **salida** estándar a un archivo (sobrescribe el archivo si existe)                                       |
| `>>`    | Redirigir la **salida** estándar a un archivo (añade al final del archivo si existe)                                   |
| `<`     | Redirigir la **entrada** estándar desde un archivo                                                                     |
| `2>`    | Redirigir la **salida** de **error** estándar a un archivo (sobrescribe el archivo si existe)                          |
| `2>>`   | Redirigir la **salida** de **error** estándar a un archivo (añade al final del archivo si existe)                      |
| `&>`    | Redirigir tanto la **salida** estándar como la **salida** de **error** a un archivo (sobrescribe el archivo si existe) |

### Conjuntos

| Símbolo       | Descripción                                                                            |
| ------------- | -------------------------------------------------------------------------------------- |
| `[abc]`       | Coincide con cualquiera de los caracteres `a`, `b` o `c`                               |
| `[a-z]`       | Coincide con cualquier carácter en el rango de `a` a `z`                               |
| `[A-Z]`       | Coincide con cualquier carácter en el rango de `A` a `Z`                               |
| `[0-9]`       | Coincide con cualquier dígito del `0` al `9`                                           |
| `[!abc]`      | Coincide con cualquier carácter excepto `a`, `b` o `c`                                 |
| `[!a-z]`      | Coincide con cualquier carácter excepto los del rango de `a` a `z`                     |
| `[!A-Z]`      | Coincide con cualquier carácter excepto los del rango de `A` a `Z`                     |
| `[!0-9]`      | Coincide con cualquier carácter excepto los dígitos del `0` al `9`                     |
| `[0-9!]`      | Coincide con cualquier dígito del `0` al `9` o el carácter `!`                         |
| `[a-zA-Z]`    | Coincide con cualquier letra mayúscula o minúscula                                     |
| `[a-zA-Z0-9]` | Coincide con cualquier carácter alfanumérico (letras mayúsculas, minúsculas y dígitos) |
| `[.,;:!?]`    | Coincide con cualquiera de los signos de puntuación especificados                      |

### Caracteres de escape comunes

| Símbolo | Descripción                 |
| ------- | --------------------------- |
| `\n`    | Nueva línea                 |
| `\t`    | Tabulación horizontal       |
| `\r`    | Retorno de carro            |
| `\a`    | Alerta (beep)               |
| `\b`    | Retroceso                   |
| `\v`    | Tabulación vertical         |
| `\\`    | Barra invertida (backslash) |
| `\'`    | Comilla simple              |
| `\"`    | Comilla doble               |

### `declare` - Definir variables y arrays

| Comando              | Descripción                                                  |
| -------------------- | ------------------------------------------------------------ |
| `declare VAR`        | Definir una variable                                         |
| `declare -r VAR`     | Definir una variable de solo lectura (constante)             |
| `readonly VAR`       | Definir una variable de solo lectura (constante)             |
| `declare -i VAR`     | Definir una variable como entero (solo números)              |
| `declare -a ARRAY`   | Definir un array unidimensional                              |
| `declare -A ARRAY`   | Definir un array asociativo                                  |
| `declare -x VAR`     | Definir una variable de entorno (exportada a subprocesos)    |
| `declare -p VAR`     | Mostrar la definición de una variable o array                |
| `declare -f FUNCION` | Mostrar el código de una función                             |
| `declare -F FUNCION` | Mostrar solo el nombre de una función                        |
| `declare -l VAR`     | Convertir el valor de una variable a minúsculas al asignarla |
| `declare -u VAR`     | Convertir el valor de una variable a mayúsculas al asignarla |

### Parámetros posicionales y especiales

| Símbolo | Descripción                                                         |
| ------- | ------------------------------------------------------------------- |
| `$0`    | **Nombre** del script o comando ejecutado                           |
| `$1`    | Primer argumento pasado al script                                   |
| `$2`    | Segundo argumento pasado al script                                  |
| `...`   | ...                                                                 |
| `$1-$9` | Primeros nueve argumentos pasados al script                         |
| `$n`    | n-ésimo argumento pasado al script                                  |
| `$#`    | **Número total de argumentos** pasados al script                    |
| `$*`    | **Todos los argumentos** pasados al script como una sola **cadena** |
| `$@`    | **Todos los argumentos** pasados al script como una **lista**       |
| `$$`    | **ID del proceso** del script actual                                |
| `$?`    | Código de **salida** del **último comando** ejecutado               |

### Operador `bc` - Calculadora de precisión arbitraria

| Comando                           | Descripción                                                     |
| --------------------------------- | --------------------------------------------------------------- |
| `echo "expresión" \| bc`          | Evaluar una expresión matemática simple                         |
| `echo "scale=n; expresión" \| bc` | Evaluar una expresión matemática con 'n' decimales de precisión |
| `bc -l`                           | Iniciar `bc` con la biblioteca matemática estándar cargada      |

**Funciones matemáticas comunes en `bc -l`:**

- `s(x)`: Seno de `x` (en radianes)
- `c(x)`: Coseno de `x` (en radianes)
- `a(x)`: Arco seno de `x` (devuelve valor en radianes)
- `l(x)`: Logaritmo natural de `x`
- `e(x)`: Exponencial de `x` (e^x)
- `j(n, x)`: Función de Bessel de orden `n` en `x`
- `sqrt(x)`: Raíz cuadrada de `x`
- `scale=n`: Establecer la precisión a 'n' decimales
- `length(x)`: Longitud de la cadena `x`
- `ibase=n`: Establecer la base de entrada a 'n' (números en base 'n')
- `obase=n`: Establecer la base de salida a 'n' (resultados en base 'n')

### Operadores de comparación de enteros

| Operador | Descripción                                      | Ejemplo          | Resultado |
| -------- | ------------------------------------------------ | ---------------- | --------- |
| `-eq`    | Igual a                                          | `5 -eq 5`        | true      |
| `-ne`    | No igual a                                       | `5 -ne 3`        | true      |
| `-lt`    | Menor que                                        | `3 -lt 5`        | true      |
| `-le`    | Menor o igual que                                | `5 -le 5`        | true      |
| `-gt`    | Mayor que                                        | `7 -gt 5`        | true      |
| `-ge`    | Mayor o igual que                                | `5 -ge 5`        | true      |
| `=`      | Igual a (cadenas)                                | `"abc" = "abc"`  | true      |
| `==`     | Igual a (cadenas)                                | `"abc" == "abc"` | true      |
| `!=`     | No igual a (cadenas)                             | `"abc" != "def"` | true      |
| `<`      | Menor que (cadenas, orden lexicográfico)         | `"abc" < "def"`  | true      |
| `>`      | Mayor que (cadenas, orden lexicográfico)         | `"def" > "abc"`  | true      |
| `>=`     | Mayor o igual que (cadenas, orden lexicográfico) | `"def" >= "def"` | true      |
| `<=`     | Menor o igual que (cadenas, orden lexicográfico) | `"abc" <= "def"` | true      |

### Operaciones con ficheros

| Operador | Devuelve true si...                                         |
| -------- | ----------------------------------------------------------- |
| `-e`     | El fichero o directorio **existe**                          |
| `-f`     | El fichero **existe** y es un fichero regular               |
| `-d`     | El directorio **existe**                                    |
| `-r`     | El fichero o directorio es **legible**                      |
| `-w`     | El fichero o directorio es **escribible**                   |
| `-x`     | El fichero o directorio es **ejecutable**                   |
| `-s`     | El fichero **existe** y no está vacío                       |
| `-L`     | El fichero es un **enlace simbólico**                       |
| `-O`     | El fichero o directorio es propiedad del **usuario actual** |
| `-G`     | El fichero o directorio es propiedad del **grupo actual**   |
| `-nt`    | El fichero1 es **más nuevo que** el fichero2                |
| `-ot`    | El fichero1 es **más antiguo que** el fichero2              |

### Opciones del comando `read`

| Opción | Descripción                                                                   |
| ------ | ----------------------------------------------------------------------------- |
| `-p`   | Mostrar un **mensaje** antes de leer la entrada                               |
| `-t`   | Establecer un **tiempo límite** (en segundos) para la entrada                 |
| `-n`   | Leer un número **específico de caracteres**                                   |
| `-s`   | Leer la entrada de forma **silenciosa** (no muestra los caracteres escritos)  |
| `-sp`  | Combina las opciones `-s` y `-p` para leer de forma silenciosa con un mensaje |

### Comandos básicos de shell

| Comando             |                          | Descripción                                                                          |
| ------------------- | ------------------------ | ------------------------------------------------------------------------------------ |
| Shebang             | #!/bin/[shell]           | Indicar el intérprete de comandos para ejecutar el script                            |
| Pipe                | `filtro1 \| filtro2`     | Encadenar cualquier número de filtros                                                |
| Comando condicional | `comando1 && comando2`   | Ejecutar `comando2` solo si `comando1` se ejecuta correctamente (código de salida 0) |
|                     | `comando1 \|\| comando2` | Ejecutar `comando2` solo si `comando1 falla (código de salida distinto de 0)         |
| Subsistema          | `$(comando)`             | Ejecutar un comando y usar su salida como parte de otro comando                      |
| `which`             | `[ejecutable]`           | Mostrar la ubicación del ejecutable                                                  |
| `sh`                | `[script.sh]`            | Ejecutar un script de shell                                                          |
| `bash`              | `[script.sh]`            | Ejecutar un script de bash                                                           |
| `set`               | `[opciones]`             | Configurar opciones del intérprete de comandos                                       |
|                     | `set -e`                 | Salir del script si cualquier comando falla                                          |
|                     | `set -x`                 | Mostrar cada comando antes de ejecutarlo                                             |
| `env`               |                          | Mostrar todas las variables de entorno                                               |
| Definir variable    | `variable=valor`         | Definir una variable en un script de shell                                           |
| `read`              | `[variable]`             | Leer entrada del usuario y almacenarla en una variable                               |
| `export`            | `[variable]`             | Exportar una variable de entorno para que esté disponible en subprocesos             |
| `alias`             | `[nombre]='[comando]'`   | Crear un alias para un comando o una serie de comandos                               |
| `unalias`           | `[nombre]`               | Eliminar un alias creado previamente                                                 |
| Crontab             | `crontab [opciones]`     | Abrir el editor por defecto de crontab                                               |
|                     | `crontab -e`             | Editar las tareas programadas en el crontab                                          |
|                     | `crontab -l`             | Listar las tareas programadas en el crontab                                          |
|                     | `crontab -r`             | Eliminar todas las tareas programadas en el crontab                                  |
| Comentarios         | `# comentario`           | Añadir comentarios en scripts de shell                                               |
| Programar tarea     | `* * * * * comando`      | Programar una tarea en crontab (min, hora, día del mes, mes, día de la semana)       |
