# Conceptos básicos sobre el sistema de archivos

En Linux, el sistema de archivos está organizado en una estructura jerárquica similar a un árbol, donde todo comienza desde el _directorio raíz (root directory)_ `/`.

| **Índice de contenidos**                                                  |
| ------------------------------------------------------------------------- |
| [Información básica de un archivo](#información-básica-de-un-archivo)     |
| [Tipos de sistemas de archivos](#tipos-de-sistemas-de-archivos)           |
| [Montaje de sistemas de archivos](#montaje-de-sistemas-de-archivos)       |
| [Estructura del sistema de archivos](#estructura-del-sistema-de-archivos) |
| [Rutas absolutas y relativas](#rutas-absolutas-y-relativas)               |
| [Directorios importantes en Linux](#directorios-importantes-en-linux)     |
| [Tipos de archivos en Linux](#tipos-de-archivos-en-linux)                 |

## Información básica de un archivo

Cada archivo y directorio en Linux tiene asociado un conjunto de **atributos** que proporcionan información sobre el mismo.

Puedes ver esta información utilizando el comando `ls -l`:

```bash
usuario@maquina:~$ ls -l archivo.txt
-rw-r--r-- 1 usuario grupo 2048 jun 10 12:34 archivo.txt
```

| Atributo       | Descripción                                                                                                              |
| -------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `-rw-r--r--`   | Permisos del fichero (lectura, escritura, ejecución).                                                                    |
| `1`            | Número de enlaces duros al fichero _(número de subdirectorios inmediatos que tiene más su directorio padre y él mismo)_. |
| `usuario`      | Propietario del fichero.                                                                                                 |
| `grupo`        | Grupo asociado al fichero.                                                                                               |
| `2048`         | Tamaño del fichero en bytes.                                                                                             |
| `jun 10 12:34` | Fecha y hora de la última modificación.                                                                                  |
| `archivo.txt`  | Nombre del fichero.                                                                                                      |

## Tipos de sistemas de archivos

Linux soporta varios tipos de sistemas de archivos, entre los más comunes se encuentran:

| Tipo    | Descripción                                                                              |
| ------- | ---------------------------------------------------------------------------------------- |
| `ext4`  | Sistema de archivos predeterminado en muchas distribuciones Linux.                       |
| `xfs`   | Sistema de archivos de alto rendimiento.                                                 |
| `btrfs` | Sistema de archivos moderno con características avanzadas.                               |
| `ntfs`  | Sistema de archivos utilizado por Windows.                                               |
| `vfat`  | Sistema de archivos compatible con FAT32. Permite el uso de archivos con nombres largos. |

Para **ver el tipo de sistema de archivos de una partición**, puedes usar el comando `df -T`:

```bash
usuario@maquina:~$ df -T
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
/dev/sda1      ext4     205113600 1024000 19360000  5% /
tmpfs          tmpfs     16384000       0 16384000  0% /dev/shm
```

- `tmpfs` es un sistema de archivos temporal que reside en la memoria RAM (volátil).

## Montaje de sistemas de archivos

El **montaje** es el proceso de hacer que un sistema de archivos esté accesible en un punto específico del árbol de directorios.

El comando `mount` se utiliza para montar sistemas de archivos.

```bash
sudo mount /dev/sdb1 /mnt/usb
```

## Estructura del sistema de archivos

En Linux, todo es un **fichero**. Los directorios, los ficheros y los dispositivos son ficheros.

El sistema de ficheros de Linux se organiza en una **estructura jerárquica de tipo árbol**.

La raíz del árbol es el directorio `/` _(root directory)_, y todos los demás directorios y ficheros se organizan a partir de ahí.

```bash
ls /
bin  boot  dev  etc  home  lib  lib64  lost+found  mc  media  mnt  opt  output  proc  root  run  sbin  srv  sys  tmp  usr  var
```

> Más información sobre la jerarquía de sistemas de archivos en Linux: [FHS 3.0](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html)

Para visualizar la estructura de directorios, puedes usar el comando `tree` (si no está instalado, puedes instalarlo con `sudo apt install tree` en distribuciones basadas en Debian):

```bash
usuario@maquina:~$ tree
/
├── bin
├── etc
├── home
│   └── usuario
├── lib
├── usr
└── var
```

```bash
tree -D    # Muestra las fechas de modificación
tree -L 2  # Limita la profundidad a 2 niveles
```

Para ver la **estructura de un directorio específico**:

```bash
usuario@maquina:~$ tree /home/usuario
/home/usuario
├── Documentos
├── Descargas
├── Imágenes
└── Música
```

Para ver la estructura de directorios **paginada**, puedes combinar `tree` con `less`:

```bash
tree | less
```

## Rutas absolutas y relativas

- Una **ruta absoluta** es la ruta completa desde el directorio raíz `/` hasta el archivo o directorio deseado. Siempre comienza con `/`.

  Ejemplo de ruta absoluta:

  ```bash
  /home/usuario/Documentos/archivo.txt
  ```

- Una **ruta relativa** es la ruta desde el directorio actual hasta el archivo o directorio deseado. No comienza con `/`.

  Ejemplo de ruta relativa:

  ```bash
  Documentos/archivo.txt
  ```

### Bajar y subir directorios

| Símbolo              | Descripción                                                                    |
| -------------------- | ------------------------------------------------------------------------------ |
| `.` _(punto)_        | Referencia al directorio actual.                                               |
| `..` _(doble punto)_ | Referencia al directorio padre (directorio que contiene el directorio actual). |

Para **bajar** un nivel en la jerarquía de directorios, usa `cd nombre_directorio`:

```bash
usuario@maquina:~$ cd Documentos
usuario@maquina:~/Documentos$
```

Para **subir** un nivel en la jerarquía de directorios, usa `cd ..`:

```bash
usuario@maquina:~/Documentos$ cd ..
usuario@maquina:~$
```

Para **subir varios niveles**, usa `cd ../../` (sube dos niveles en este caso):

```bash
usuario@maquina:~/Documentos/Proyectos$ cd ../..
usuario@maquina:~$
```

## Directorios importantes en Linux

| Directorio    | Descripción                                                                                                                                                                                                                                                                                                     |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/`           | El directorio raíz.                                                                                                                                                                                                                                                                                             |
| `/bin`        | Aplicaciones **binarias** o **ejecutables** (comandos) esenciales del sistema.                                                                                                                                                                                                                                  |
| `/boot`       | Ficheros necesarios para el **arranque** del sistema, incluidos el kernel y el gestor de arranque (GRUB).                                                                                                                                                                                                       |
| `/dev`        | Archivos de **dispositivos**.<br>`/dev/console`: Consola principal del sistema.<br>`/dev/hd`: Discos duros con interfaz IDE.<br>`/dev/sd`: Discos duros con interfaz SCSI y SATA.<br>`/dev/null`: Dispositivo nulo, cualquier dato enviado a este dispositivo se pierde.<br>`/dev/tty`: Consolas virtuales.<br> |
| `/etc`        | Archivos de **configuración** del sistema.<br>Solamente el superusuario (root) puede modificar estos archivos.<br>Uno de los archivos más importantes en este directorio es `passwd`, que contiene información sobre las cuentas de usuario.                                                                    |
| `/home`       | Directorios **personales** de los usuarios.                                                                                                                                                                                                                                                                     |
| `/lib`        | **Bibliotecas** compartidas necesarias para ejecutar programas.                                                                                                                                                                                                                                                 |
| `/lost+found` | Archivos **recuperados** después de errores del sistema de archivos.<br>En este directorio se almacena información y procesos que se estaban ejecutando cuando el sistema se cae.                                                                                                                               |
| `/media`      | Puntos de montaje para **medios extraíbles** (USB, CD-ROM).                                                                                                                                                                                                                                                     |
| `/mnt`        | Sistemas de archivos que han sido **montados manualmente** en el disco duro.                                                                                                                                                                                                                                    |
| `/opt`        | Aplicaciones y paquetes de software **adicionales** (de terceros).                                                                                                                                                                                                                                              |
| `/proc`       | Sistema de archivos **virtual** que proporciona información del sistema y procesos.<br>No existe en el disco duro, se monta desde la memoria RAM.                                                                                                                                                               |
| `/root`       | Directorio personal del usuario **root** (administrador - superusuario).                                                                                                                                                                                                                                        |
| `/run`        | Archivos de **estado** y **PID** de los procesos en ejecución.                                                                                                                                                                                                                                                  |
| `/sbin`       | Ejecutables del sistema para **administración y mantenimiento**.<br>Únicamente accesibles por el usuario root.<br>Aquí residen comandos para montar y desmontar sistemas de archivos, apagar el sistema y utilidades de red y dispositivos.                                                                     |
| `/srv`        | Datos de **servicios** proporcionados por el sistema (servidores web, FTP, etc.).                                                                                                                                                                                                                               |
| `/sys`        | Sistema de archivos **virtual** que proporciona información sobre dispositivos y controladores.                                                                                                                                                                                                                 |
| `/tmp`        | Archivos **temporales** creados por aplicaciones.                                                                                                                                                                                                                                                               |
| `/usr`        | Aplicaciones y archivos de **usuario**.                                                                                                                                                                                                                                                                         |
| `/var`        | Archivos **variables**, como registros y bases de datos.<br>En `/var/log` se almacenan los registros del sistema y de las aplicaciones.                                                                                                                                                                         |

## Tipos de archivos en Linux

En Linux, existen varios tipos de archivos, cada uno con una función específica. Los tipos de archivos más comunes son:

### Archivos ordinarios

Contienen la información con la que trabaja cada usuario (documentos, imágenes, ejecutables, etc.).

### Enlaces físicos o duros _(hard links)_

- Son referencias adicionales a un mismo archivo en el sistema de archivos.
- No son un tipo de archivo sino un segundo nombre que se le da a un archivo ya existente.
- Se utilizan en situaciones en las que un archivo tiene que ser compartido por varios usuarios o programas.
- Si creamos un enlace duro al archivo para cada usuario cada vez que uno de ellos modifique cualquier dato en el archivo, los otros usuarios lo podrán ver. Realmente están viendo y modificando el mismo archivo.

### Enlaces simbólicos

- También se utilizan para asignar un segundo nombre a un archivo o directorio ya existente.
- A diferencia de los enlaces duros, los enlaces simbólicos pueden apuntar a archivos o directorios ubicados en diferentes sistemas de archivos.
- Si el archivo original es eliminado, el enlace simbólico queda roto y no funciona.
- Si tenemos un enlace duro, los datos no se borrarán hasta que se hayan borrado todos y cada uno de los enlaces duros que existen hacia esos datos en el sistema de ficheros.

### Directorios

Archivos especiales que contienen referencias a otros archivos y directorios.

### Archivos especiales

- Archivos que representan dispositivos de hardware o interfaces del sistema.
- En Linux, todo dispositivo físico que se conecte al equipo está asociado a un archivo.
- Linux, trata estos archivos como archivos ordinarios.

### Comandos para gestionar diferentes tipos de archivos

| Carácter | Descripción                                                                                          |
| -------- | ---------------------------------------------------------------------------------------------------- |
| `-`      | Archivo **ordinario** (documentos, imágenes, ejecutables, etc.)                                      |
| `d`      | **Directorio**                                                                                       |
| `l`      | Enlace **simbólico** (acceso directo a otro archivo o directorio)                                    |
| `c`      | Archivo de dispositivo de **caracteres** (dispositivos que manejan datos carácter por carácter)      |
| `b`      | Archivo de dispositivo de **bloques** (dispositivos que manejan datos en bloques, como discos duros) |
| `s`      | Socket (utilizado para la comunicación entre procesos, generalmente en redes)                          |
| `p`      | Tubo nombrado o FIFO (canal de comunicación unidireccional entre procesos)                           |

## Archivos importantes en Linux

| Archivo                   | Descripción                                                          |
| ------------------------- | -------------------------------------------------------------------- |
| `/etc/passwd`             | Contiene información sobre las cuentas de usuario.                   |
| `/etc/shadow`             | Contiene las contraseñas cifradas de los usuarios.                   |
| `/etc/group`              | Contiene información sobre los grupos de usuarios.                   |
| `/etc/sudoers`            | Configuración de permisos para el uso de `sudo`.                     |
| `/etc/fstab`              | Configuración de sistemas de archivos y puntos de montaje.           |
| `/etc/hosts`              | Mapeo de nombres de host a direcciones IP.                           |
| `/etc/resolv.conf`        | Configuración de servidores DNS.                                     |
| `/etc/network/interfaces` | Configuración de interfaces de red.                                  |
| `/etc/crontab`            | Tareas programadas para ejecución automática.                        |
| `/etc/profile`            | Configuración global del entorno de usuario.                         |
| `/etc/bash.bashrc`        | Configuración global para el shell Bash.                             |
| `/proc/meminfo`           | Información sobre el uso de la memoria del sistema.                  |
| `/proc/cpuinfo`           | Información sobre el procesador del sistema.                         |
| `/var/log/syslog`         | Registro del sistema y eventos importantes.                          |
| `/var/log/auth.log`       | Registro de autenticaciones y eventos relacionados con la seguridad. |
