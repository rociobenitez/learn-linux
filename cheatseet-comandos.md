# Tabla de comandos

## Navegación y gestión de archivos y directorios

| Comando |                                      | Descripción                                                                                    |
| ------- | ------------------------------------ | ---------------------------------------------------------------------------------------------- |
| `ls`    | `[opciones] [fichero/directorio]`    | Listar archivos y directorios                                                                  |
|         | `ls -l`                              | Listar con detalles (permisos, propietario, tamaño, fecha)                                     |
|         | `ls -lh`                             | Listar con detalles en un formato legible (tamaños en KB, MB...)                               |
|         | `ls -a`                              | Listar incluidos los ocultos                                                                   |
|         | `ls -la`                             | Listar con detalles incluidos los ocultos                                                      |
|         | `ls -lt`                             | Listar con detalles ordenados por fecha (más recientes primero)                                |
|         | `ls -ltr`                            | Listar con detalles ordenados por fecha (más antiguos primero)                                 |
|         | `ls -s`                              | Listar mostrando el tamaño de cada archivo en bloques de 1 KB                                  |
|         | `ls -R`                              | Listar de forma recursiva todos los subdirectorios                                             |
| `pwd`   |                                      | Mostrar el directorio actual                                                                   |
| `cd`    | `[directorio]`                       | Cambiar de directorio                                                                          |
|         | `cd ~`                               | Ir al directorio home del usuario                                                              |
|         | `cd -`                               | Volver al directorio anterior                                                                  |
|         | `cd ..`                              | Subir un nivel en la jerarquía de directorios                                                  |
| `sudo`  | `[comando]`                          | Ejecutar un comando con privilegios de superusuario                                            |
| `nano`  | `[fichero]`                          | Editar archivo de texto con el editor nano                                                     |
| `touch` | `[fichero]`                          | Crear nuevo archivo vacío o actualizar la fecha de modificación                                |
| `mkdir` | `[directorio]`                       | Crear nuevo directorio                                                                         |
| `cp`    | `[opciones] [origen] [destino]`      | Copiar fichero o directorio                                                                    |
| `mv`    | `[opciones] [origen] [destino]`      | Mover o renombrar fichero o directorio                                                         |
| `rmdir` | `[directorio]`                       | Eliminar directorio vacío                                                                      |
| `rm`    | `[opciones] [fichero]`               | Eliminar fichero                                                                               |
|         | `rm -r`                              | Eliminar un directorio y su contenido de forma recursiva.                                      |
| `find`  | `[ruta] -name [patrón]`              | Buscar archivos y directorios por nombre                                                       |
|         | `[ruta] -type [f\|d] -name [patrón]` | Buscar archivos (`f`) o directorios (`d`) por nombre                                           |
|         | `[ruta] -size [+-]n[cwbkMG]`         | Buscar archivos por tamaño (n: tamaño, c: bytes, w: palabras, b: bloques, k: KB, M: MB, G: GB) |
|         | `find /home -name "*.txt"`           | Buscar todos los archivos `.txt` en el directorio `/home`                                      |
| `file`  | `[fichero]`                          | Determinar el tipo de un archivo                                                               |
| `tree`  | `[opciones] [directorio]`            | Mostrar la estructura de directorios en forma de árbol                                         |
|         | `tree -a`                            | Incluir archivos ocultos en la visualización del árbol                                         |
|         | `tree -L n`                          | Limitar la profundidad del árbol a `n` niveles                                                 |
|         | `tree -d`                            | Mostrar solo directorios en la visualización del árbol                                         |
|         | `tree -h`                            | Mostrar tamaños de archivos en formato legible en la visualización del árbol                   |
| `ln`    | `-s [origen] [destino]`              | Crear un enlace simbólico (acceso directo)                                                     |

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

## Trabajar con archivos de texto

| Comando |                                           | Descripción                                                            |
| ------- | ----------------------------------------- | ---------------------------------------------------------------------- |
| `cat`   | `[archivo]`                               | **Mostrar contenido** de un archivo                                    |
|         | `cat archivo1 archivo2`                   | Concatenar y mostrar el contenido de varios archivos                   |
| `less`  | `[archivo]`                               | Mostrar contenido de un archivo página por página                      |
| `more`  | `[archivo]`                               | Mostrar contenido de un archivo página por página (similar a `less`)   |
| `head`  | `[opciones] [archivo]`                    | Mostrar las primeras líneas de un archivo                              |
|         | `head -5 archivo.txt`                     | Mostrar las primeras 5 líneas de un archivo                            |
| `tail`  | `[opciones] [archivo]`                    | Mostrar las últimas líneas de un archivo                               |
|         | `tail -5 archivo.txt`                     | Mostrar las últimas 5 líneas de un archivo                             |
| `echo`  | `[argumentos]`                            | Mostrar argumentos o texto en consola                                  |
| `sort`  | `[opciones] [archivo]`                    | **Ordenar** las líneas de un archivo de texto                          |
|         | `sort archivo.txt`                        | Ordenar las líneas de un archivo en orden alfabético                   |
|         | `sort -r archivo.txt`                     | Ordenar las líneas de un archivo en orden inverso                      |
| `uniq`  | `[opciones] [archivo]`                    | **Eliminar líneas duplicadas** consecutivas en un archivo de texto     |
|         | `uniq archivo.txt`                        | Mostrar líneas únicas de un archivo                                    |
|         | `uniq -c archivo.txt`                     | **Contar ocurrencias** de líneas únicas en un archivo                  |
| `wc`    | `[opciones] [archivo]`                    | Contar líneas, palabras y caracteres en un archivo                     |
|         | `wc -l archivo.txt`                       | Contar solo las líneas en un archivo                                   |
|         | `wc -w archivo.txt`                       | Contar solo las palabras en un archivo                                 |
|         | `wc -c archivo.txt`                       | Contar solo los caracteres en un archivo                               |
| `grep`  | `[opciones] patrón [archivo]`             | **Buscar texto** dentro de un archivo                                  |
|         | `grep -i "texto" archivo.txt`             | Buscar texto **sin distinguir mayúsculas/minúsculas**                  |
|         | `grep -n "texto" archivo.txt`             | Buscar texto mostrando el número de línea                              |
|         | `grep -v "texto" archivo.txt`             | Buscar líneas que **no** contienen el texto                            |
|         | `grep -c "texto" archivo.txt`             | Contar el número de líneas que contienen el texto                      |
|         | `grep -E "expresión_regular" archivo.txt` | Buscar usando una expresión regular                                    |
|         | `grep -r "texto" /ruta/del/directorio`    | Buscar texto de forma recursiva en un directorio                       |
| `paste` | `[opciones] archivo1 archivo2`            | Combinar líneas de archivos lado a lado                                |
| `cut`   | `[opciones] [archivo]`                    | **Extraer secciones** específicas de cada línea de un archivo de texto |
|         | `cut -d"," -f1 archivo.csv`               | Extraer la primera columna de un archivo CSV (separado por comas)      |
| `tar`   | `[opciones] [fichero]`                    | Crear o extraer archivos tar                                           |
|         | `tar -cvf archivo.tar directorio/`        | Crear un archivo tar desde un directorio                               |
| `zip`   | `[opciones] [fichero]`                    | Comprimir archivos o directorios en formato zip                        |
|         | `zip -r archivo.zip directorio/`          | Comprimir un directorio en un archivo zip                              |
| `unzip` | `[opciones] [fichero]`                    | Extraer archivos de un archivo zip                                     |
|         | `unzip archivo.zip`                       | Extraer el contenido de un archivo zip                                 |
| `tr`    | `[opciones]`                              | Traducir o eliminar caracteres en un flujo de texto                    |
|         | `tr 'a-z' 'A-Z' < archivo.txt`            | Convertir minúsculas a mayúsculas en un archivo de texto               |
|         | `tr -d 'aeiou' < archivo.txt`             | Eliminar vocales de un archivo de texto                                |

## Comandos para ver ficheros de configuración de usuarios y grupos

| Comando                                  | Descripción                                                                   |
| ---------------------------------------- | ----------------------------------------------------------------------------- |
| `cat /etc/passwd`                        | Ver contenido del fichero `/etc/passwd` (información de usuarios).            |
| `cat /etc/passwd \| grep nombre_usuario` | Ver información de un usuario específico en el fichero `/etc/passwd`.         |
| `cat /etc/passwd \| cut -d":" -f1`       | Ver solo los nombres de usuario del fichero `/etc/passwd`.                    |
| `cat /etc/group`                         | Ver contenido del fichero `/etc/group` (información de grupos).               |
| `cat /etc/shadow`                        | Ver contenido del fichero `/etc/shadow` (contraseñas cifradas). _(solo root)_ |
| `cat /etc/gshadow`                       | Ver contenido del fichero `/etc/gshadow` (contraseñas de grupos).             |
| `less /etc/passwd`                       | Ver contenido del fichero `/etc/passwd` paginado.                             |
| `more /etc/passwd`                       | Ver contenido del fichero `/etc/passwd` paginado.                             |

## Gestión de usuarios y grupos

### Mostrar información de usuarios y grupos

| Comando                  | Descripción                                                                                                                               |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `whoami`                 | Mostrar el nombre del usuario actual.                                                                                                     |
| `groups`                 | Mostrar los grupos a los que pertenece el usuario actual.                                                                                 |
| `groups usuario`         | Mostrar los grupos a los que pertenece un usuario.                                                                                        |
| `id`                     | Mostrar el UID, GID y grupos del usuario actual.                                                                                          |
| `id -u`                  | Mostrar solo el UID del usuario actual.                                                                                                   |
| `id -un`                 | Mostrar solo el nombre del usuario actual.                                                                                                |
| `id -g`                  | Mostrar solo el GID del usuario actual.                                                                                                   |
| `id -gn`                 | Mostrar solo el nombre del grupo primario del usuario actual                                                                              |
| `id -G`                  | Mostrar todos los GID de los grupos a los que pertenece el usuario actual.                                                                |
| `id -Gn`                 | Mostrar todos los nombres de los grupos a los que pertenece el usuario actual.                                                            |
| `id usuario`             | Mostrar el UID, GID y grupos a los que pertenece un usuario.                                                                              |
| `getent group <usuario>` | Mostrar todos los usuarios pertenecientes a un grupo específico.                                                                          |
| `ls -l`                  | Verificar permisos, propietario y grupo de ficheros y directorios.                                                                        |
| `ls -ltr`                | Listar ficheros y directorios con detalles (permisos, propietario, tamaño), ordenados por fecha de modificación (más recientes al final). |

### Cambiar entre usuarios y obtener privilegios de administrador

| Comando              | Descripción                                                        |
| -------------------- | ------------------------------------------------------------------ |
| `sudo -i`            | Iniciar sesión como usuario root / Cambiar a usuario root          |
| `sudo -i -u usuario` | Iniciar sesión como el usuario especificado                        |
| `sudo su`            | Cambiar al usuario root (sin cambiar variables de entorno)         |
| `su -`               | Cambiar al usuario root (con contraseña establecida)               |
| `su usuario`         | Cambiar al usuario especificado (manteniendo variables de entorno) |
| `su - usuario`       | Cambiar al usuario especificado sin heredar variables de entorno   |

### Creación y eliminación de usuarios y grupos

| Comando                                                           | Descripción                                                                      |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `useradd <usuario>`                                               | **Crear un nuevo usuario**                                                       |
| `useradd <usuario> <grupo>`                                       | Crear un nuevo usuario asignado a un grupo                                       |
| `useradd <usuario> -u 1010 -g <grupo>`                            | Crear un nuevo usuario con un UID específico                                     |
| `useradd -g <grupo> -d /home/<usuario> -m -s /bin/bash <usuario>` | Crear un nuevo usuario asignado a un grupo, con directorio personal y shell bash |
| `userdel <usuario>`                                               | **Eliminar un usuario**                                                          |
| `userdel -r <usuario>`                                            | Eliminar un usuario y su directorio home                                         |
| `groupadd <grupo>`                                                | **Crear un nuevo grupo** de usuarios                                             |
| `groupadd -g <GID> <grupo>`                                       | Crear un grupo y asignarle un GID específico                                     |
| `groupdel <grupo>`                                                | **Eliminar un grupo** de usuarios                                                |

### Modificaciones en usuarios y grupos

| Comando                                   | Descripción                                                                            |
| ----------------------------------------- | -------------------------------------------------------------------------------------- |
| `usermod <usuario>`                       | Modificar la configuración de un usuario                                               |
| `usermod -d <nuevo_directorio> <usuario>` | Cambiar el directorio home de un usuario                                               |
| `usermod -l <nuevo_usuario> <usuario>`    | Renombrar un usuario                                                                   |
| `usermod -L <usuario>`                    | Bloquear la cuenta de un usuario _(no podrá iniciar sesión)_                           |
| `usermod -U <usuario>`                    | Desbloquear la cuenta de un usuario                                                    |
| `usermod -u <nuevo_UID> <usuario>`        | Cambiar el UID de un usuario                                                           |
| `usermod -g <nuevo_grupo> <usuario>`      | Cambiar el grupo primario de un usuario                                                |
| `usermod -aG <grupo> <usuario>`           | **Añadir un usuario a un grupo secundario**                                            |
| `usermod -s /bin/zsh <usuario>`           | Cambiar la shell de un usuario                                                         |
| `usermod -e <AAAA-MM-DD> <usuario>`       | Establecer una fecha de expiración para la cuenta de un usuario                        |
| `usermod -c "Info adicional" <usuario>`   | Agregar información adicional a la cuenta de un usuario (nombre completo, teléfono...) |
| `groupmod <grupo>`                        | Modificar la configuración de un grupo                                                 |
| `groupmod -n <nuevo_grupo> <grupo>`       | Renombrar un grupo de usuarios                                                         |
| `groupmod -d <nuevo_directorio> <grupo>`  | Cambiar el directorio home asociado a un grupo de usuarios                             |
| `newgrp <grupo>`                          | Cambiar el grupo primario del usuario actual. _(pedirá la contraseña)_                 |

### Gestión de contraseñas

| Comando              | Descripción                                                                            |
| -------------------- | -------------------------------------------------------------------------------------- |
| `passwd <usuario>`   | Cambiar la contraseña de un usuario (se deben tener permisos de sudo o ser el usuario) |
| `gpasswd <grupo>`    | Administrar contraseñas y miembros de grupos.                                          |
| `gpasswd -r <grupo>` | Eliminar la contraseña de un grupo.                                                    |
| `chage <usuario>`    | Modificar la información de expiración de la contraseña y cuenta.                      |

### Gestión de permisos

| Comando                       | Descripción                                                                                                                         |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `chmod`                       | Cambiar los permisos de ficheros y directorios.                                                                                     |
| `chown`                       | Cambiar el propietario y grupo de ficheros y directorios.                                                                           |
| `chown usuario fichero`       | Cambiar solo el propietario de un fichero o directorio.                                                                             |
| `chown usuario:grupo fichero` | Cambiar el propietario y grupo de un fichero o directorio.                                                                          |
| `umask`                       | Mostrar o establecer la máscara de permisos por defecto para nuevos ficheros y directorios.                                         |
| `umask -S`                    | Establecer máscara de permisos por defecto para nuevos ficheros y directorios en formato simbólico.                                 |
| `umask -S 027`                | Establecer máscara de permisos por defecto para nuevos ficheros y directorios a `750` (prop: r, w, x; grupo: r, x; otros: ninguno). |

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

**Ejemplos de uso del comando `chmod`:**

| Comando                              | Descripción                                                                                                                              |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `chmod u+rwx,g+rx,o-rwx fichero.txt` | Establecer permisos de lectura, escritura y ejecución para el propietario; lectura y ejecución para el grupo; ningún permiso para otros. |
| `chmod -x fichero.txt`               | Quitar el permiso de ejecución para todos (propietario, grupo y otros).                                                                  |
| `chmod o+r+w fichero.txt`            | Dar permisos de lectura y escritura a otros usuarios.                                                                                    |
| `chmod u+s fichero.txt`              | Establecer el bit SUID en un fichero (ejecución con permisos del propietario).                                                           |
| `chmod u-s fichero.txt`              | Quitar el bit SUID de un fichero.                                                                                                        |
| `chmod g+s fichero.txt`              | Establecer el bit SGID en un fichero o directorio (ejecución con permisos del grupo).                                                    |
| `chmod g-s <carpeta_compartida>`     | Quitar el bit SGID de un fichero o directorio.                                                                                           |
| `chmod o+t <carpeta_temporal>`       | Establecer el bit sticky en un directorio (solo el propietario de un fichero dentro del directorio puede borrarlo).                      |
| `chmod o-t <carpeta_temporal>`       | Quitar el bit sticky de un directorio.                                                                                                   |

## Comandos de red

| Comando    |                        | Descripción                                                        |
| ---------- | ---------------------- | ------------------------------------------------------------------ |
| `hostname` |                        | Mostrar o establecer el nombre del host del sistema                |
| `ifconfig` |                        | Mostrar o configurar interfaces de red                             |
| `ip`       | `[interfaz]`           | Mostrar o configurar parámetros de la interfaz de red              |
|            | `[opciones]`           | Mostrar o manipular el enrutamiento, dispositivos y túneles de red |
|            | `ip addr` o `ip a`     | Mostrar direcciones IP asignadas a las interfaces de red           |
| `ping`     | `[opciones] [host]`    | Comprobar la conectividad con otro host                            |
|            | `ping -c 4 google.com` | Enviar 4 paquetes ICMP a google.com y mostrar el resultado         |
| `curl`     | `[opciones] URL`       | Transferir datos desde o hacia un servidor                         |
| `wget`     | `[opciones] URL`       | Descargar archivos de la web                                       |

## Comandos de procesos

| Comando   |                                               | Descripción                                                          |
| --------- | --------------------------------------------- | -------------------------------------------------------------------- |
| `ps`      | `[opciones]`                                  | Mostrar procesos en ejecución                                        |
|           | `ps -l`                                       | Muestra una lista larga con más detalles                             |
|           | `ps -f`                                       | Muestra una lista completa con detalles adicionales                  |
|           | `ps -l`                                       | Muestra una lista larga con más detalles                             |
|           | `ps -a`                                       | Muestra procesos de todos los usuarios en la terminal actual         |
|           | `ps -u nombre_usuario`                        | Muestra procesos del usuario especificado                            |
|           | `ps -U nombre_usuario`                        | Muestra procesos del usuario especificado y sus hijos                |
|           | `ps -C nombre_proceso`                        | Muestra procesos por nombre de comando                               |
|           | `ps -x`                                       | Muestra procesos sin terminal asociado                               |
|           | `ps -p PID`                                   | Muestra información del proceso con el PID especificado              |
|           | `ps -o pid,ppid,cmd,%mem,%cpu`                | Muestra columnas específicas                                         |
|           | `ps -eo pid,ppid,cmd,%mem,%cpu`               | Muestra columnas específicas                                         |
|           | `ps -eo pid,ppid,cmd,%mem,%cpu --sort==-%mem` | Muestra columnas específicas ordenadas por uso de memoria            |
|           | `ps -ef`                                      | Muestra todos los procesos en formato completo                       |
|           | `ps -ef \| less`                              | Muestra todos los procesos con paginación                            |
|           | `ps aux`                                      | Muestra todos los procesos con detalles adicionales                  |
|           | `ps aux --sort -pcpu`                         | Ordena los procesos por uso de CPU                                   |
|           | `ps aux --sort -pmem`                         | Ordena los procesos por uso de memoria                               |
|           | `ps aux --sort -pcpu,+pmem`                   | Ordena los procesos por uso de CPU y memoria                         |
|           | `ps aux \| grep nombre_usuario`               | Filtra procesos por nombre de usuario                                |
|           | `ps aux \| grep ' R '`                        | Muestra procesos en estado 'Ejecutando o listo para ejecutarse'      |
|           | `ps aux \| grep ' S '`                        | Muestra procesos en estado 'Suspendido (sleeping)'                   |
|           | `ps aux \| awk '{print $1, $2, $3, $4, $11}'` | Muestra usuario, PID, uso de CPU, uso de memoria y comando           |
|           | `ps aux \| awk '$8=="R" {print $0}'`          | Muestra solo procesos en estado 'Ejecutando o listo para ejecutarse' |
| `pgrep`   | `[opciones] nombre_proceso`                   | Buscar procesos por nombre                                           |
|           | `pgrep -u nombre_usuario nombre_proceso`      | Buscar procesos por nombre de usuario y nombre de proceso            |
| `pstree`  | `[opciones] [PID]`                            | Mostrar árbol de procesos                                            |
|           | `pstree -p`                                   | Mostrar árbol de procesos con PIDs                                   |
|           | `pstree -u`                                   | Mostrar árbol de procesos con nombres de usuario                     |
| `uptime`  |                                               | Muestra el tiempo de actividad del sistema y la carga media          |
| `top`     | `[opciones]`                                  | Mostrar procesos en tiempo real                                      |
|           | `top -u nombre_usuario`                       | Mostrar procesos de un usuario específico                            |
| `htop`    |                                               | Mostrar procesos en tiempo real con interfaz mejorada                |
| `kill`    | `[PID]`                                       | Terminar un proceso por su ID                                        |
| `killall` | `[nombre_proceso]`                            | Terminar todos los procesos con el nombre especificado               |
| `swapon`  | `[opciones]`                                  | Activar espacio de intercambio (swap)                                |
|           | `swapon -s`                                   | Mostrar el estado del espacio de intercambio (swap)                  |
| `swapoff` |                                               | Desactivar espacio de intercambio (swap)                             |
| `vmstat`  | `[opciones]`                                  | Proporcionar estadísticas detalladas de memoria                      |
|           | `vmstat -s`                                   | Mostrar el uso de memoria y swap en bloques                          |

## Programación en shell

| Comando             |                          | Descripción                                                                          |
| ------------------- | ------------------------ | ------------------------------------------------------------------------------------ |
| Shebang             | #!/bin/[shell]           | Indicar el intérprete de comandos para ejecutar el script                            |
| Pipe                | `filtro1 \| filtro2`     | Encadenar cualquier número de filtros                                                |
| Redirección         | `>`                      | Redirigir la salida estándar a un fichero (sobrescribiendo su contenido)             |
|                     | `>>`                     | Redirigir la salida estándar a un fichero (añadiendo al final del fichero)           |
|                     | `2>`                     | Redirigir la salida de errores a un fichero (sobrescribiendo su contenido)           |
|                     | `2>>`                    | Redirigir la salida de errores a un fichero (añadiendo al final del fichero)         |
|                     | `&>`                     | Redirigir tanto la salida estándar como la de errores a un fichero                   |
|                     | `&>>`                    | Redirigir tanto la salida estándar como la de errores a un fichero (añadiendo)       |
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
