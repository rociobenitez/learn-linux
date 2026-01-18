# Comandos básicos de Linux

- [Volver al índice](../README.md)
- [Entorno de Linux](./1-entorno-linux.md)
- [Sistema de archivos en Linux](./2-sistema-de-archivos.md)

**Índice de contenidos:**

- [Wildcards o caracteres comodín](#wildcards-o-caracteres-comodín)
- [Comandos básicos de Linux](#comandos-básicos-de-linux)
- [Comando para operaciones con ficheros y directorios](#comando-para-operaciones-con-ficheros-y-directorios)
- [Comandos para empaquetar y comprimir ficheros y directorios](#comandos-para-empaquetar-y-comprimir-ficheros-y-directorios)

## Wildcards o caracteres comodín

- Los **wildcards** son caracteres especiales que representan uno o más caracteres en nombres de archivos o directorios.
- Se utilizan para simplificar la selección de múltiples archivos o directorios en comandos.

| Carácter        | Descripción                                                            | Ejemplo                                                                           |
| --------------- | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `*`             | Representa **cero o más caracteres**.                                  | `*.txt` selecciona todos los archivos que terminan con `.txt`.                    |
| `?`             | Representa **un solo carácter**.                                       | `archivo?.txt` selecciona `archivo1.txt`, `archivo2.txt`, etc.                    |
| `[caracteres]`  | Representa **cualquier carácter dentro de los corchetes**.             | `archivo[123].txt` selecciona `archivo1.txt`, `archivo2.txt`, y `archivo3.txt`.   |
| `[!caracteres]` | Representa **cualquier carácter que NO esté dentro de los corchetes**. | `archivo[!123].txt` selecciona `archivo4.txt`, `archivo5.txt`, etc.               |
| `{opciones}`    | Representa **cualquiera de las opciones separadas por comas**.         | `archivo{1,2,3}.txt` selecciona `archivo1.txt`, `archivo2.txt`, y `archivo3.txt`. |

## Pipes y filtros básicos

### Filtros

Los **filtros** son comandos que:

- procesan datos de entrada
- **_transforman_** o filtran esa información
- producen una salida modificada

Podemos pensar en un filtro como un "colador" o transformador que deja pasar solo la información que cumple ciertos criterios.

Algunos ejemplos son `wc`, `cat`, `more`, `head`, `grep`, `sort`.

El valor de los filtros se puede encadenar usando el símbolo de **pipe** `|`.

### Pipe `|`

Permite encadenar secuencias de comandos de filtrado.

El parón de uso es:

```bash
comando1 | comando2
comando1 | comando2 | comando3
```

La salida de `comando1` se convierte en la entrada de `comando2`, y así sucesivamente.

<img src="images/pipes.jpeg" alt="Pipe Diagram" style="display: block; margin: 16px 0; width: 500px;">

## Comandos básicos de Linux

| Comando               | Descripción                                                 | Ejemplo                |
| --------------------- | ----------------------------------------------------------- | ---------------------- |
| [`man`](#man)         | Muestra el manual de usuario de un comando.                 | `man ls`               |
| [`help`](#help)       | Proporciona ayuda sobre un comando específico.              | `ls --help`            |
| [`pwd`](#pwd)         | Imprime el directorio de trabajo actual (ruta completa).    | `pwd`                  |
| [`ls`](#ls)           | Lista los archivos y directorios en el directorio actual.   | `ls`                   |
| [`cd`](#cd)           | Cambia el directorio de trabajo actual.                     | `cd nombre_directorio` |
| [`history`](#history) | Muestra el historial de comandos utilizados en la terminal. | `history`              |
| [`date`](#date)       | Muestra o establece la fecha y hora del sistema.            | `date`                 |
| [`cal`](#cal)         | Muestra un calendario en la terminal.                       | `cal 2025`             |
| [`df`](#df)           | Muestra el uso del espacio en disco.                        | `df -h`                |
| [`free`](#free)       | Muestra el uso de la memoria del sistema.                   | `free -h`              |
| [`exit`](#exit)       | Sale de la sesión actual de la terminal.                    | `exit`                 |

### `man`

- **Muestra** el manual de usuario de un comando.
- Proporciona información detallada sobre la sintaxis, opciones y ejemplos de uso del comando

```bash
man ls
```

Salida:

```plaintext
LS(1)                     User Commands                    LS(1)
NAME
       ls - list directory contents
...
```

- Para **salir** del manual, presiona la tecla `q` _(quit)_.
- Para ver la ayuda página a página puedes usar la **barra espaciadora** para avanzar y `b` para retroceder.
- `enter` avanza una línea a la vez.

Si dentro de una página de ayuda se necesita **buscar una cadena** se utiliza:

```bash
/cadena_a_buscar (ENTER)
```

con las teclas `n` y `N` se navega entre los resultados hacia adelante y hacia atrás respectivamente.

### `--help`

- **Proporciona** ayuda sobre un comando específico.
- Muestra información sobre la sintaxis y las opciones disponibles.

```bash
ls --help
```

Salida:

```plaintext
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
...
```

### `pwd`

**Imprime** el directorio de trabajo actual (ruta completa).

```bash
pwd
```

### `ls`

**Lista** los archivos y directorios en el directorio actual.

**Sin opciones:**

```bash
ls
```

**Listar un directorio específico:**

```bash
ls /ruta/del/directorio
```

**Opciones comunes de `ls`:**

| Opción | Descripción                                                               |
| ------ | ------------------------------------------------------------------------- |
| -a     | Incluye archivos ocultos                                                  |
| -l     | Lista detallada con permisos, propietario, tamaño y fecha                 |
| -h     | Muestra tamaños legibles por humanos (KB, MB, GB)                         |
| -lh    | Lista detallada con tamaños legibles por humanos (KB, MB, GB)             |
| -R     | Lista recursiva de subdirectorios                                         |
| -S     | Ordena por tamaño de archivo                                              |
| -t     | Ordena por fecha de modificación                                          |
| -d     | Muestra solo los nombres de los directorios, no su contenido              |
| -F     | Añade un carácter al final de cada nombre para indicar el tipo de archivo |

#### `ls -l`

```bash
ls -l
```

Salida:

```bash
total 440
drwxr-xr-x   2 root root  4096 Apr 17  2022 adduser
drwxr-xr-x   2 root root  4096 Sep 24 19:11 applications
drwxr-xr-x   6 root root  4096 Oct  9 18:16 apport
drwxr-xr-x   3 root root  4096 Apr 17  2022 apps
drwxr-xr-x   2 root root  4096 Oct  9 18:15 apt
drwxr-xr-x   2 root root  4096 Apr 17  2022 aptitude
drwxr-xr-x   4 root root  4096 Apr 17  2022 apt-xapian-index
drwxr-xr-x   2 root root  4096 Apr 17  2022 awk
. . .
```

**Campos del listado largo de `ls -l`:**

| Campo         | Descripción                                       |
| ------------- | ------------------------------------------------- |
| `drwxr-xr-x`  | Permisos del archivo o directorio                 |
| `2`           | Número de enlaces fuertes al archivo o directorio |
| `root`        | Propietario del archivo o directorio              |
| `root`        | Grupo propietario del archivo o directorio        |
| `4096`        | Tamaño del archivo o directorio en bytes          |
| `Apr 17 2022` | Fecha y hora de la última modificación            |
| `adduser`     | Nombre del archivo o directorio                   |

#### `ls -a`

```bash
ls -a
```

Salida:

```bash
.  ..  .bashrc  .profile  .ssh  documentos  imagenes  musica  videos
```

#### Con múltiples opciones

```bash
ls -laR  # Lista detallada, incluyendo archivos ocultos, de forma recursiva
```

### `cd`

**Cambia** el directorio de trabajo actual.

```bash
cd nombre_del_directorio
```

```bash
cd /     # Cambia al directorio raíz
cd ~     # Cambia al directorio home del usuario
cd .     # Cambia al directorio actual (sin efecto)
cd ..    # Sube un nivel en la jerarquía de directorios
cd ../.. # Sube dos niveles en la jerarquía de directorios
cd -     # Vuelve al directorio anterior
```

Con rutas absolutas y relativas:

```bash
cd /etc  # Ruta absoluta
```

```bash
cd ../var/log  # Ruta relativa
```

### `history`

- **Muestra** el historial de comandos utilizados en la terminal.
- Permite ver y reutilizar comandos anteriores.

```bash
history
```

Salida:

```plaintext
  1  ls
  2  cd /home
  3  pwd
  4  history
```

Para recuperar y ejecutar un comando específico del historial, podemos pulsar las teclas de flecha arriba (↑) y abajo (↓) para navegar por los comandos previos.

### `date`

**Muestra** o **establece** la fecha y hora del sistema.

**Información sobre el tiempo:**

```bash
date +"%H:%M:%S"              # Ejemplo de salida: 15:30:45
date +"%Y-%m-%d %H:%M:%S"     # Ejemplo de salida: 2025-06-14 15:30:45
date +"%T"                    # Muestra la hora en formato HH:MM:SS
date +"%r"                    # Muestra la hora en formato de 12 horas con AM/PM
date +"%Z %z"                 # Muestra la zona horaria y el desplazamiento UTC
```

**Información sobre la fecha:**

```bash
date +"%Y-%m-%d"              # Ejemplo de salida: 2025-06-14
date +"%A, %d de %B de %Y"    # Ejemplo de salida: viernes, 14 de junio de 2025
date +"Semana %V del año %Y"  # Ejemplo de salida: Semana 24 del año 2025
date +"%j"                    # Muestra el día del año (001-366)
date +"%u"                    # Muestra el día de la semana (1-7, lunes es 1)
date +"%D"                    # Muestra la fecha en formato MM/DD/AA
```

**Otras opciones útiles:**

```bash
date -d "next Friday"          # Muestra la fecha del próximo viernes
date -u                        # Muestra la fecha y hora en UTC
date -s "2024-12-31 23:59:59"  # Establece la fecha y hora del sistema (requiere permisos de superusuario)
```

### `cal`

**Muestra** un calendario en la terminal.

```bash
cal
```

```bash
cal 2024     # Muestra el calendario del año 2024
cal 06 2024  # Muestra el calendario de junio de 2024
```

_Ejemplo de salida:_

```plaintext
     June 2024
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
```

### `df`

**Muestra** el uso del espacio en disco.

```bash
df
```

```bash
df -T    # Tipo de sistema de archivos junto con el uso del espacio en disco
df -h    # Uso espacio en disco en formato legible por humanos (KB, MB, GB)
df -Th   # Tipo de sistema de archivos y uso en formato legible por humanos (KB, MB, GB)
```

Salida:

```plaintext
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/disk3s1s1                         926Gi    16Gi   546Gi     3%    447k  4.3G    0%   /
devfs                                  208Ki   208Ki     0Bi   100%     720     0  100%   /dev
/dev/disk3s6                           926Gi    20Ki   546Gi     1%       0  5.7G    0%   /System/Volumes/VM
/dev/disk3s2                           926Gi    15Gi   546Gi     3%    1.9k  5.7G
...
```

### `free`

**Muestra** el uso de la memoria del sistema.

```bash
free
```

```bash
free -h    # Muestra la memoria en formato legible por humanos (KB, MB, GB)
```

Salida:

```plaintext
              total        used        free      shared  buff/cache   available
Mem:           15Gi       3.2Gi       9.1Gi       512Mi       2.7Gi        11Gi
Swap:         2.0Gi          0Bi       2.0Gi
```

### `exit`

**Sale** de la sesión actual de la terminal.

```bash
exit
```

## Comando para operaciones con ficheros y directorios

| Comando           | Descripción                                                                                     | Ejemplo                          |
| ----------------- | ----------------------------------------------------------------------------------------------- | -------------------------------- |
| [`touch`](#touch) | Crea un archivo vacío o actualiza la fecha de modificación.                                     | `touch nombre_archivo`           |
| [`cat`](#cat)     | Muestra el contenido de un archivo de texto.                                                    | `cat nombre_archivo`             |
| [`less`](#less)   | Permite ver el contenido de un archivo de texto de forma paginada.                              | `less nombre_archivo`            |
| [`more`](#more)   | Permite ver el contenido de un archivo de texto de forma paginada (menos interactivo que less). | `more nombre_archivo`            |
| [`wc`](#wc)       | Cuenta líneas, palabras y caracteres en un archivo de texto.                                    | `wc nombre_archivo`              |
| [`sort`](#sort)   | Ordena las líneas de un archivo de texto.                                                       | `sort nombre_archivo`            |
| [`uniq`](#uniq)   | Elimina líneas duplicadas consecutivas en un archivo de texto.                                  | `uniq nombre_archivo`            |
| [`tail`](#tail)   | Muestra las últimas líneas de un archivo de texto.                                              | `tail nombre_archivo`            |
| [`head`](#head)   | Muestra las primeras líneas de un archivo de texto.                                             | `head nombre_archivo`            |
| [`echo`](#echo)   | Imprime texto o el valor de variables en la terminal.                                           | `echo "Hola, mundo!"`            |
| [`cp`](#cp)       | Copia archivos o directorios.                                                                   | `cp origen destino`              |
| [`mv`](#mv)       | Mueve o renombra archivos o directorios.                                                        | `mv origen destino`              |
| [`rm`](#rm)       | Elimina archivos o directorios.                                                                 | `rm nombre_archivo`              |
| [`mkdir`](#mkdir) | Crea un nuevo directorio.                                                                       | `mkdir nombre_directorio`        |
| [`rmdir`](#rmdir) | Elimina un directorio vacío.                                                                    | `rmdir nombre_directorio`        |
| [`ln`](#ln)       | Crea enlaces simbólicos o duros.                                                                | `ln -s origen enlace`            |
| [`cut`](#cut)     | Corta secciones de cada línea de un archivo.                                                    | `cut -d',' -f1 archivo.csv`      |
| [`paste`](#paste) | Fusiona líneas de múltiples archivos juntos.                                                    | `paste archivo1 archivo2`        |
| [`grep`](#grep)   | Busca patrones dentro de archivos o entradas.                                                   | `grep "texto" archivo`           |
| [`tr`](#tr)       | Traduce o elimina caracteres de la entrada.                                                     | `tr 'a-z' 'A-Z'`                 |
| [`file`](#file)   | Determina el tipo de un archivo.                                                                | `file nombre_archivo`            |
| [`type`](#type)   | Indica si un comando es interno o externo.                                                      | `type ls`                        |
| [`which`](#which) | Muestra la ruta completa de un comando.                                                         | `which ls`                       |
| [`find`](#find)   | Busca archivos y directorios en una jerarquía de directorios.                                   | `find /ruta -name "archivo.txt"` |

### `touch`

**Crea** un archivo vacío o **actualiza** la fecha de modificación de un archivo existente.

```bash
touch nombre_del_archivo
touch nombre_del_archivo_existente
```

```bash
touch directorio/nombre_del_archivo
touch nombre_del_archivo{1..3}.txt  # Crea múltiples archivos
touch -c nombre_del_archivo         # No crea el archivo si no existe
touch -a nombre_del_archivo         # Actualiza solo la fecha de último acceso
touch -m nombre_del_archivo         # Actualiza solo la fecha de última modificación
```

### `cat`

**Muestra** el contenido de un archivo de texto.

```bash
cat nombre_archivo.txt
cat /ruta/del/archivo.txt
```

```bash
cat archivo1.txt archivo2.txt  # Muestra el contenido de múltiples archivos
```

Permite **concatenar** (fusionar) archivos y **redirigir** la salida a un nuevo archivo:

```bash
cat fichero.dat > archivo_nuevo.txt   # Crea un nuevo archivo con el contenido de fichero.dat
cat fichero.dat >> ejemplo.txt  # Añade el contenido de fichero.dat a ejemplo.txt
cat archivo1.txt archivo2.txt > archivo_concatenado.txt  # Fusiona archivo1.txt y archivo2.txt en archivo_concatenado.txt
```

### `less`

**Permite ver** el contenido de un archivo de texto de forma paginada.

Permite desplazarse por el contenido del archivo hacia adelante y hacia atrás (útil para archivos grandes).

```bash
less nombre_archivo.txt
```

**Comandos básicos dentro de `less`:**

| Tecla             | Acción                                     |
| ----------------- | ------------------------------------------ |
| Barra espaciadora | Avanza una página hacia adelante           |
| Enter             | Avanza una línea hacia adelante            |
| Flecha abajo      | Avanza una línea hacia adelante            |
| Flecha arriba     | Retrocede una línea hacia atrás            |
| /cadena           | Busca "cadena" hacia adelante              |
| ?cadena           | Busca "cadena" hacia atrás                 |
| n                 | Repite la búsqueda en la misma dirección   |
| N                 | Repite la búsqueda en la dirección opuesta |
| h                 | Muestra la ayuda de `less`                 |
| q                 | Sale de `less`                             |

### `more`

**Permite ver** el contenido de un archivo de texto de forma paginada (menos interactivo que `less`).

```bash
more nombre_archivo.txt
```

### `wc`

**Cuenta** líneas, palabras y caracteres en un archivo de texto.

```bash
wc nombre_archivo.txt
```

```bash
wc -l nombre_archivo.txt    # Cuenta solo las líneas
wc -w nombre_archivo.txt    # Cuenta solo las palabras
wc -c nombre_archivo.txt    # Cuenta solo los caracteres
```

### `sort`

**Ordena** las líneas de un archivo de texto.

```bash
sort nombre_archivo.txt
```

```bash
sort -r nombre_archivo.txt        # Ordena en orden inverso
sort -n nombre_archivo.txt        # Ordena numéricamente
sort -k2 nombre_archivo.txt       # Ordena por la segunda columna
sort -u nombre_archivo.txt        # Elimina líneas duplicadas mientras ordena
```

Ejemplo:

```bash
$ cat animales.txt
gato
perro
pájaro
perro
gato
gato
caballo
pez
```

```bash
$ sort animales.txt
caballo
gato
gato
gato
perro
perro
pájaro
pez
```

### `uniq`

**Elimina** líneas duplicadas consecutivas en un archivo de texto.

```bash
uniq nombre_archivo.txt
```

```bash
uniq -c nombre_archivo.txt  # Cuenta las ocurrencias de cada línea
uniq -d nombre_archivo.txt  # Muestra solo las líneas duplicadas
uniq -u nombre_archivo.txt  # Muestra solo las líneas únicas
```

Ejemplo con `animales.txt`:

```bash
$ uniq animales.txt
gato
perro
pájaro
perro
gato
caballo
pez
```

Se eliminan los duplicados consecutivos, pero los duplicados no consecutimos como "gato" y "perro" siguen apareciendo.

Pero si combinamos `sort` y `uniq`:

```bash
$ sort animales.txt | uniq -c
    1 caballo
    3 gato
    2 perro
    1 pájaro
    1 pez
```

### `tail`

- **Muestra** las últimas líneas de un archivo de texto.
- Por defecto, muestra las últimas 10 líneas.

```bash
tail nombre_archivo.txt
tail -n 20 nombre_archivo.txt   # Muestra las últimas 20 líneas
tail -f nombre_archivo.txt      # Muestra nuevas líneas en tiempo real
```

### `head`

- **Muestra** las primeras líneas de un archivo de texto.
- Por defecto, muestra las primeras 10 líneas.

```bash
head nombre_archivo.txt
head -n 15 nombre_archivo.txt    # Muestra las primeras 15 líneas
head -c 50 nombre_archivo.txt    # Muestra los primeros 50 bytes
```

### `echo`

**Imprime** texto o el valor de variables en la terminal.

```bash
echo "Hola, mundo!"
```

```bash
echo $HOME
echo $PATH
```

```bash
echo -e "Hola, \nmundo!"  # Imprime con interpretación de secuencias de escape
echo -e "Hola, \tmundo!"  # Imprime con tabulación
echo -e "Hola, \\ mundo!" # Imprime con barra invertida
```

### `cp`

**Copia** archivos o directorios.

```bash
cp archivo_origen.txt archivo_destino.txt
cp -r directorio_origen/ directorio_destino/  # Copia recursivamente un directorio
cp -i archivo_origen.txt archivo_destino.txt  # Pregunta antes de sobrescribir
cp -u archivo_origen.txt archivo_destino.txt  # Copia solo si el origen es más reciente que el destino
cp -v archivo_origen.txt archivo_destino.txt  # Muestra los archivos mientras se copian
```

Podemos **copiar múltiples ficheros** a un directorio:

```bash
cp archivo1.txt archivo2.txt archivo3.txt directorio_destino/
```

Podemos **copiar múltiples ficheros cuyos nombres sigan un patrón** usando wildcards:

```bash
cp archivo*.txt directorio_destino/
```

### `mv`

**Mueve** o **renombra** archivos o directorios.

```bash
mv archivo_origen.txt archivo_destino.txt     # Mueve o renombra un archivo
mv directorio_origen/ directorio_destino/     # Mueve o renombra un directorio
mv archivo_viejo.txt archivo_nuevo.txt        # Renombra un archivo
mv archivo.txt /ruta/del/directorio/          # Mueve un archivo a otro directorio
mv -i archivo_origen.txt archivo_destino.txt  # Pregunta antes de sobrescribir
```

### `rm`

**Elimina** archivos o directorios.

```bash
rm nombre_del_archivo
rm -f nombre_del_archivo       # Fuerza la eliminación sin pedir confirmación
rm -i nombre_del_archivo       # Pregunta antes de eliminar
rm -r nombre_del_directorio    # Elimina un directorio y su contenido de forma recursiva
rm -rf nombre_del_directorio   # Fuerza la eliminación recursiva sin pedir confirmación
```

Lo que se borra se elimina de forma **permanente**.

Para **directorios no vacíos** (que tienen ficheros), se debe usar la opción `-r` (recursivo):

```bash
rm -r nombre_del_directorio
```

Los comandos [`mkdir`](#mkdir) y [`rmdir`](#rmdir) tienen uso exclusivo para directorios.

### `mkdir`

**Crea** un nuevo directorio.

```bash
mkdir nombre_del_directorio
mkdir -p directorio1/directorio2  # Crea directorios padres si no existen
```

### `rmdir`

**Elimina** un directorio vacío. Si no está vacío, mostrará un error.

```bash
rmdir nombre_del_directorio
```

Para eliminar directorios con contenido, se debe usar el comando [`rm`](#rm) con la opción `-r`.

### `ln`

**Crea** enlaces simbólicos o duros.

```bash
ln archivo_origen enlace_duro           # Crea un enlace duro
```

Para crear un enlace simbólico (blando) a un directorio:

```bash
ln -s /ruta/del/directorio enlace_simbolico_soft
```

### `cut`

**Corta** secciones de cada línea de un archivo.

```bash
cut -c 5 archivo.txt        # Corta el quinto carácter de cada línea
cut -c 1,3,5 archivo.txt    # Corta los caracteres 1, 3 y 5 de cada línea
cut -c 1-5 archivo.txt      # Corta los primeros 5 caracteres de cada línea
```

Con **delimitadores** _(delimiters - `cut -d`) y **campos** _(fields - `cut -f`)\_:

```bash
cut -f2 archivo.txt          # Corta el segundo campo (por defecto usa tabulador como delimitador)
cut -d',' -f1 archivo.csv    # Corta el primer campo usando ',' como delimitador
cut -d';' -f1-3 archivo.csv  # Corta los primeros tres campos usando ';' como delimitador
```

Ejemplos de delimitadores comunes: `,` (coma), `;` (punto y coma), `:` (dos puntos), `|` (barra vertical), espacio, tabulador.

Podemos usar la opción `--complement` para **excluir** campos o caracteres:

```bash
cut -d',' -f2 --complement archivo.csv  # Excluye el segundo campo
```

Ejemplo: obtener los usuarios del fichero `/etc/passwd`:

```bash
cut -d':' -f1 /etc/passwd
```

### `paste`

Fusiona líneas de múltiples archivos juntos.

```bash
paste archivo1.txt archivo2.txt
```

Salida:

```plaintext
Línea1_Archivo1    Línea1_Archivo2
Línea2_Archivo1    Línea2_Archivo2
Línea3_Archivo1    Línea3_Archivo2
```

Con **delimitadores personalizados**:

```bash
paste -d ',' archivo1.txt archivo2.txt
```

Salida:

```plaintext
Línea1_Archivo1,Línea1_Archivo2
Línea2_Archivo1,Línea2_Archivo2
Línea3_Archivo1,Línea3_Archivo2
```

### `grep`

**Busca** patrones dentro de archivos o entradas.

```bash
grep "texto_a_buscar" nombre_archivo.txt
```

Salida:

```plaintext
línea que contiene texto_a_buscar
```

**Opciones más importantes y usadas**

| Opción      | Descripción                                                                     |
| ----------- | ------------------------------------------------------------------------------- |
| `-i`        | Ignora mayúsculas y minúsculas al buscar                                        |
| `-r` o `-R` | Busca de forma recursiva en directorios                                         |
| `-n`        | Junto con las **líneas coincidentes**, también imprime los **números de línea** |
| `-c`        | **Conteo de líneas** que coinciden con el patrón                                |
| `-v`        | Líneas que **no** coinciden con el patrón                                       |
| `-w`        | Busca coincidencias de **palabras** completas                                   |
| `-l`        | Muestra solo los nombres de archivos que contienen el patrón                    |
| `-o`        | Muestra solo las partes de la línea que coinciden con el patrón                 |
| `-E`        | Permite usar expresiones regulares extendidas                                   |
| `-A n`      | Muestra `n` líneas **después** de la línea coincidente                          |
| `-B n`      | Muestra `n` líneas **antes** de la línea coincidente                            |
| `-C n`      | Muestra `n` líneas **antes y después** de la línea coincidente                  |

**Ejemplos:**

```bash
grep "error" archivo.log  # Muestra líneas que contienen "error"
grep -v login /etc/passwd  # Muestra líneas que no contienen "login"
grep -oE "\b[0-9]{3}\b" archivo.txt  # Muestra solo números de 3 dígitos
grep -n "warning" archivo.log  # Muestra líneas con "warning" junto con sus números de línea
```

Podemos combinar `grep` con otros comandos usando el pipe `|` para filtrar resultados. Por ejemplo, para buscar procesos relacionados con "ssh":

```bash
ps aux | grep "ssh"
```

O para buscar una palabra específica en un archivo:

```bash
cat archivo.txt | grep "palabra"
```

### `tr`

**Traduce** o **elimina** caracteres de la entrada.

Sintaxis básica:

```bash
tr [opciones] conjunto_caracteres_objetivo conjunto_caracteres_de_reemplazo
```

```bash
tr 'a' 'A'            # Traduce todas las 'a' a 'A'
tr ' ' '\n'           # Reemplaza espacios por saltos de línea
tr 'a-z' 'A-Z'        # Traduce minúsculas a mayúsculas
tr 'A-Z' 'a-z'        # Traduce mayúsculas a minúsculas
tr -d 'aeiou'         # Elimina las vocales
tr -s ' '             # Squeeze: reemplaza múltiples espacios por uno solo
tr -c 'a-zA-Z' ''     # Elimina todos los caracteres que no sean letras
tr -cd 'a-zA-Z\n' ''  # Elimina todo lo que no coincida con el patrón indicado, conservando saltos de línea
```

Ejemplos de uso con tuberías:

```bash
echo "hola mundo" | tr 'a-z' 'A-Z'    # Salida: HOLA MUNDO
echo "hola    mundo" | tr -s ' '      # Salida: hola mundo
echo "hola mundo" | tr ' ' '\n'       # Salida: hola\nmundo
echo "hola mundo 123" | tr -d '0-9'   # Elimina todos los dígitos
cat archivo.txt | tr -d '0-9'         # Elimina todos los dígitos del archivo
```

```bash
$ echo "Linux and shell scripting are awesome!" | tr "aeiou" "_"
L_n_x _nd sh_ll scr_pt_ng _r_ _w_s_m_!
```

```bash
$ echo "Linux and shell scripting are awesome!" | tr -c "aeiou" "_"
_i_u__a_____e______i__i___a_e_a_e_o_e_
```

Con archivos, puedes usar `cat` en combinación con `tr`:

```bash
cat archivo.txt | tr '[a-z]' '[A-Z]' # Convierte todo el contenido del archivo a mayúsculas
cat archivo.txt | tr -d '0-9'    # Elimina todos los dígitos del archivo
```

Ejemplo:

```bash
$ cat lenguajes.txt | tr '[a-z]' '[A-Z]'
PYTHON
JAVASCRIPT
JAVA
C++
RUBY
GO
```

Combinar `tr` con otros comandos:

```bash
$ sort animales.txt | uniq | tr '[a-z]' '[A-Z]'
CABALLO
GATO
PERRO
PÁJARO
PEZ
```

### `file`

**Determina** el tipo de un archivo.

```bash
file nombre_del_archivo
```

Ejemplos:

```bash
file documento.pdf  # Salida: documento.pdf: PDF document, version 1.4
file imagen.png     # Salida: imagen.png: PNG image data, 800 x 600, 8-bit/color RGB, non-interlaced
file script.sh      # Salida: script.sh: Bourne-Again shell script, ASCII text executable
file planning.txt   # Salida: planning.txt: ASCII text
```

### `type`

**Indica** si un comando es interno o externo.

```bash
type nombre_del_comando
```

Ejemplo:

```bash
type ls
ls is aliased to `ls --color=auto`
```

### `which`

**Muestra** la ruta completa de un comando (donde se encuentra el archivo binario ejecutable).

```bash
which nombre_del_comando
```

Ejemplo:

```bash
which ls
/usr/bin/ls
```

`which` responde con el primer archivo que encuentra. Si se desea ver todas las ubicaciones posibles, se puede usar `-a`:

```bash
which -a nombre_del_comando
```

### `find`

**Busca** archivos y directorios en una jerarquía de directorios.

```bash
find /ruta/de/búsqueda -name "nombre_archivo"
```

```bash
find . -name "*.txt"          # Busca todos los archivos .txt en el directorio actual y subdirectorios
find . -iname "Archivo.TXT"   # Búsqueda sin distinguir mayúsculas/minúsculas
find . -not -name "*.log"     # Busca todos los archivos que no terminan en .log
find . -name "archivo?.txt"   # Busca archivos con un solo carácter entre "archivo" y ".txt"
```

Ejemplo: buscar un archivo llamado "documento.txt" en el directorio `/home` y sus subdirectorios.

```bash
find /home -name "documento.txt"
```

Salida:

```plaintext
/home/usuario/documentos/documento.txt
/home/otro_usuario/documento.txt
```

**Buscar archivos y directorios vacíos:**

```bash
find / -empty
```

Linux permite buscar por **tipo de archivo**:

```bash
find . -type f -name "*.sh"    # Busca solo archivos regulares con extensión .sh
find . -type d -name "dir*"    # Busca solo directorios que comienzan con "dir"
find . -type l -name "enlace*" # Busca solo enlaces simbólicos que comienzan con "enlace"
find . -type c                 # Busca solo archivos de caracteres especiales
find . -type b                 # Busca solo archivos de bloques especiales
```

Hay 3 **registros de tiempo** que se pueden usar para buscar archivos según su fecha:

- `-atime n` : archivos **accedidos** hace `n` días.
- `-mtime n` : archivos **modificados** hace `n` días.
- `-ctime n` : archivos **cuyo estado cambió** hace `n` días.

Ejemplos:

```bash
find . -mtime -7      # Busca archivos modificados en los últimos 7 días
find . -atime +30     # Busca archivos accedidos hace más de 30 días
find . -ctime 0       # Busca archivos cuyo estado cambió hoy
```

También se puede buscar por **tamaño** de archivo:

```bash
find . -size +1G              # Busca archivos mayores de 1GB
find . -size +100M            # Busca archivos mayores de 100MB
find . -size -10k             # Busca archivos menores de 10KB
find . -size 1b               # Busca archivos de exactamente 1 byte
find . -size +500M -size -2G  # Busca archivos entre 500MB y 2GB
```

```bash
find /var/log -type f -size +10M  # Busca archivos mayores de 10MB en /var/log
```

También se puede buscar por **propietario** del archivo:

```bash
find / -user usuario123  # Busca archivos pertenecientes al usuario con UID 123
find / -group grupo123   # Busca archivos pertenecientes al grupo con GID 123
```

Otra opción útil es buscar archivos por **permisos**:

```bash
find . -perm 644          # Busca archivos con permisos exactos 644
find . -perm -u=x         # Busca archivos donde el propietario tiene permiso de ejecución
find . -perm /u=w         # Busca archivos donde el propietario tiene permiso de escritura
find . -perm -g=r         # Busca archivos donde el grupo tiene permiso de lectura
find . -perm /222         # Busca archivos con permisos de escritura para cualquier usuario
```

Ejemplo: buscar archivos con permisos específicos y propietario determinado.

```bash
find / -perm 644 -user usuario123  # Busca archivos con permisos 644 pertenecientes a usuario123
```

## Comandos para empaquetar y comprimir ficheros y directorios

- **Empaquetar**: Combinar múltiples ficheros y/o directorios en un solo archivo (sin compresión).
- **Comprimir**: Reducir el tamaño de ficheros o directorios para ahorrar espacio (a través de algoritmos de compresión).

### `tar` _(tape archive)_

Permite **empaquetar** múltiples archivos y directorios en un solo archivo de archivo.

| Opción | Descripción                                                                                                                |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `-c`   | crear un **nuevo** archivo tar.                                                                                            |
| `-v`   | Listar de manera detallada los archivos procesados.<br>Modo detallado (_verbose_), muestra el **progreso** en la terminal. |
| `-f`   | especifica el **nombre** del archivo tar.                                                                                  |
| `-x`   | **extraer** (desempaquetar) archivos de un archivo tar.                                                                    |
| `-C`   | cambiar al directorio especificado antes de empaquetar.                                                                    |
| `-z`   | comprime/descomprime usando **gzip**.                                                                                      |
| `-r`   | añade archivos a un archivo **tar** existente.                                                                             |

**Empaquetar:**

```bash
tar -cvf archivo.tar /ruta/del/directorio  # Empaqueta sin comprimir
```

Para ver la lista de archivos dentro de un archivo tar sin extraerlos:

```bash
tar -tvf archivo.tar
```

**Comprimir (`.tgz`, `.tar.gz`):**

```bash
tar -czvf archivo.tar.gz /ruta/del/directorio  # Empaqueta y comprime con gzip (opción más común)
```

**Desempaquetar y descomprimir:**

Para descomprimir el archivo o extraer archivos del archivo:

```bash
tar -xvf archivo.tar  # Desempaqueta sin comprimir
```

```bash
tar -xzvf archivo.tar.gz  # Descomprime con gzip
```

### `zip`

- **Comprime** archivos y directorios en formato **ZIP**.
- Algunas veces es necesario que el archivo sea descomprimido en otros sistemas operativos como Windows.
- En ese caso, es preferible usar `zip` en lugar de `tar` con compresión `gzip` (mayor compatibilidad).

```bash
zip archivo.zip archivo1.txt archivo2.txt
zip archivo.zip nombre*  # Comprime todos los archivos que comienzan con "nombre"
zip archivo.zip *.txt    # Comprime todos los archivos .txt en el directorio actual
```

La opción `-r` se puede utilizar para comprimir un directorio completo:

```bash
zip -r archivo.zip /ruta/del/directorio  # Comprime un directorio de forma recursiva
```

La bandera -y para evitar que los enlaces simbólicos sean seguidos recursimante:

```bash
zip -ry bin.zip /bin # Comprime el directorio /bin sin seguir enlaces simbólicos
```

**Descomprimir:**

```bash
unzip archivo.zip
unzip -l archivo.zip  # Lista el contenido del archivo zip sin descomprimir
unzip -o archivo.zip  # Sobrescribe archivos existentes sin preguntar
```

### `gzip` y `gunzip`

- **Comprime** archivos individuales usando el algoritmo gzip.
- En Linux también se utiliza `gzip` como herramienta de compresión.

```bash
gzip nombre_archivo.txt  # Comprime el archivo, creando nombre_archivo.txt.gz
gunzip nombre_archivo.txt.gz  # Descomprime el archivo
```

### `cat` combinado con `gzip` y `gunzip`

```bash
cat archivo.txt archivo2.txt | gzip final.txt.gz  # Comprime más de un archivo en uno solo comprimido
```

```bash
cat archivo.txt.gz | gunzip -c  # Muestra el contenido descomprimido
```

## Comandos de redirección

- **Redirección**: Permite enviar la salida de un comando a un archivo o a otro comando.
- En Linux existe la capacidad de redireccionar la visualización de la pantalla (salida de un comando, de una aplicación, etc.) a: - un fichero - una impresora - cualquier otro periférico de salida
- Esta utilidad permite enviar los mensajes de error a un fichero diferente al de la salida estándar.

Por defecto:

- La **salida estándar** (stdout) es la pantalla (terminal).
- La **entrada estándar** (stdin) es el teclado.
- Los errores se redireccionan a la pantalla (terminal).

| Símbolo | Descripción                                                                     | Ejemplo                     |
| ------- | ------------------------------------------------------------------------------- | --------------------------- |
| `>`     | Redirige la **salida** estándar a un archivo (**sobrescribe**)                  | `comando > archivo.txt`     |
| `>>`    | Redirige la **salida** estándar a un archivo (**añade al final**)               | `comando >> archivo.txt`    |
| `<`     | Redirige la **entrada** estándar desde un archivo                               | `comando < archivo.txt`     |
| `2>`    | Redirige la **salida** de error a un archivo                                    | `comando 2> errores.txt`    |
| `2>>`   | Redirige la **salida** de error a un archivo (**añade al final**)               | `comando 2>> errores.txt`   |
| `2>&1`  | Redirige la **salida** de error a la misma ubicación que la **salida** estándar | `comando > salida.txt 2>&1` |

### Ejemplos de redirección de salida

```bash
$ ls -l > listado.txt     # Guarda la salida del comando ls en listado.txt
$ ls -l >> listado.txt    # Añade la salida del comando ls al final de listado.txt
$ cat listado.txt         # Muestra el contenido de listado.txt
total 8
-rw-r--r-- 1 usuario usuario  0 Jun 14 15:30 archivo1.txt
-rw-r--r-- 1 usuario usuario  0 Jun 14 15:30 archivo2.txt
```

```bash
$ grep "error" archivo.log > errores.txt  # Guarda las líneas que contienen "error" en errores.txt
$ grep "error" archivo.log >> errores.txt # Añade las líneas que contienen "error" al final de errores.txt
$ cat errores.txt
[2024-06-14 10:00:00] error: fallo en la conexión
[2024-06-14 11:15:23] error: archivo no encontrado
```

```bash
$ echo "Hola, mundo!" > saludo.txt       # Crea saludo.txt con el texto "Hola, mundo!"
$ echo "Otra línea" >> saludo.txt        # Añade "Otra línea" al final de saludo.txt
$ cat saludo.txt
Hola, mundo!
Otra línea
```

### Ejemplos de redirección de entrada

```bash
sort < nombres.txt            # Ordena las líneas del archivo nombres.txt
wc < fichero.txt              # Cuenta líneas, palabras y caracteres del archivo fichero.txt
wc -l < fichero.txt           # Cuenta las líneas del archivo fichero.txt
tr 'a-z' 'A-Z' < fichero.txt  # Traduce minúsculas a mayúsculas en fichero.txt
```

### Comando `rev``

**Invierte** el orden de los caracteres en cada línea de un archivo o entrada estándar.

```bash
rev nombre_del_archivo.txt
```

```bash
rev < fichero.txt >> archivo_invertido.txt  # Invierte el contenido de fichero.txt y lo guarda en archivo_invertido.txt
```

Salida:

```plaintext
!odnum al olah
```

### Canales estándar

- `0` o `stdin` : canal de **entrada** estándar, conectado al **teclado**
- `1` o `stdout` : canal de **salida** estándar, conectado a la **pantalla**
- `2` o `stderr` : canal de **errores** estándar, conectado a la **pantalla**

_Se pueden redirigir estos canales usando los operadores vistos anteriormente._

**Ejemplos:**

- Si no hay archivos que coincidan con los patrones (que comienzan con "t" o "y"), el comando dará error y se redireccionará al archivo `errores.txt`.
  ```bash
  ls t* y* 2> errores.txt
  comando_que_no_existe 2> errores.txt
  ```
- Redirigir tanto la salida estándar como la de errores a un mismo archivo:
  ```bash
  comando > todo.txt 2>&1
  ```
