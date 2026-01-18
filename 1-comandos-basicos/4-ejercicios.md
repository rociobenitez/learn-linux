# Ejercicios de Comandos Básicos

## Variables de entorno

### Ejercicio: Crear, verificar y eliminar una variable de entorno temporal

1. Crea y verifica una variable de entorno temporal llamada `SESION_SINCRONA` cuyo valor de arranque sea `3`.
2. Elimina la variable creada.
3. Utiliza el comando `man` para ayuda del comando `printenv`.

```bash
export SESION_SINCRONA=3
printenv SESION_SINCRONA
unset SESION_SINCRONA
man printenv
```

### Ejercicio: Mostrar el valor de variables de entorno

Estando en el home del usuario, ejecutar los siguientes comandos:

```bash
echo $SHELL
echo $HOSTNAME
echo $PATH
echo $RANDOM
echo $PWD
echo $HOME
echo $USER
```

¿Qué hace la variable `$RANDOM`?

## Comandos y flags

### Ejercicio: Explora el comando `df` y sus flags

1. Ejecuta el comando `df`.
2. Ejecuta el comando `df -h`.
3. Ejecuta el comando `df -T`.
4. Ejecuta el comando `df -Th`.

- ¿Qué indica `df`?
- ¿Cuál es la diferencia entre ellos? Identifica la función del flag `-h` y del flag `-T`.
- Realiza el mismo ejercicio con `ls` y sus flags `-l`, `-a` y `-s`.

## Sistema de Archivos

### Ejercicio: Identificar directorio actual

**Identifica tu directorio actual y su ruta absoluta:**

```bash
pwd
```

_`pwd` significa "print working directory" (imprimir directorio de trabajo)._

### Ejercicio: Listar contenido de directorio

**Lista el contenido con y sin archivos ocultos:**

```bash
ls
ls -a
ls -la  # Lista detallada con archivos ocultos
```

_En Unix/Linux, los archivos ocultos comienzan con un punto (`.`)._

_El flag `-a`significa "all" (todos) y `-l` significa "long format" (formato largo)._

### Ejercicio: Crear directorios y navegar entre ellos

**Crea un directorio llamado `proyecto` en tu directorio personal:**

```bash
mkdir ~/proyecto
```

_`~` es una abreviatura para el directorio personal del usuario actual._

### Ejercicio: Crear subdirectorios

**Crea una carpeta llamada `js` dentro de la carpeta `assets` que a su vez está dentro de `proyecto`:**

```bash
mkdir -p ~/proyecto/assets/js
```

_`-p` significa "parents" (padres) y crea los directorios padres si no existen._

### Ejercicio:

**Navega al directorio `proyecto`:**

```bash
cd ~/proyecto
```

### Ejercicio:

**Crea un archivo llamado `archivo.txt` dentro del directorio `proyecto`:**

```bash
touch archivo.txt
```

### Ejercicio:

**Mueve el archivo `archivo.txt` al directorio personal:**

```bash
mv archivo.txt ~/
```

### Ejercicio:

**Vuelve al directorio anterior sin escribir la ruta:**

```bash
cd -
```

### Ejercicio:

**Muestra el árbol de directorios desde tu directorio personal:**

```bash
tree ~/
tree -a ~/  # Incluye archivos ocultos
tree -L 2 ~/  # Limita la profundidad a 2 niveles
```

### Ejercicio:

**Diferencia entre `ls`, `ls -l` y `ls -lh`:**

- `ls`: Lista los nombres de los archivos y directorios en el directorio actual.
- `ls -l`: Lista **detallada** que incluye permisos, número de enlaces, propietario, grupo, tamaño y fecha de modificación.
- `ls -lh`: Similar a `ls -l`, pero muestra los **tamaños** de archivo en un **formato legible** (KB, MB, GB).

_`h` significa "human-readable" (legible para humanos). En lugar de decirte que un archivo pesa 1048576 bytes, te mostrará 1M._

### Ejercicio:

**Localiza tu `$HOME` usando una variable de entorno:**

```bash
echo $HOME
```

### Ejercicio:

**Comprueba qué shell estás utilizando:**

```bash
echo $SHELL
```

### Ejercicio:

**Averigua el tamaño de un directorio concreto:**

```bash
du -sh ~/proyecto
```

_`du` significa "disk usage" (uso de disco). El flag `-s` significa "summary" (resumen) y `-h` significa "human-readable" (legible para humanos: kB, MB, GB)._

_Si no pones `-s`, `du` te mostrará el tamaño de cada subdirectorio y archivo dentro del directorio especificado._

**Saber "dónde vive" un programa, por ejemplo, `python3`, `gcc` o `git`:**

```bash
which python3  # /usr/bin/python3
which gcc      # /usr/bin/gcc
which git      # /usr/bin/git
```

**Compara dos archivos para ver si son idénticos:**

```bash
diff archivo1.txt archivo2.txt
diff -u archivo1.txt archivo2.txt  # Muestra diferencias en formato unificado
diff -q archivo1.txt archivo2.txt  # Solo indica si son diferentes o no
```

_Uso real: tienes `config.yml` y `config_backup.yml`. Algo falla. Usas `diff`para ver qué línea difiere._

## Gestión de ficheros

**Crea un archivo llamado `documento.txt` en tu directorio personal:**

```bash
touch ~/documento.txt
```

**Crea un archivo llamado `saludo.txt` con la frase "Hola, Mundo!" dentro:**

```bash
echo "Hola, Mundo!" > ~/saludo.txt
```

_El símbolo `>`sobreescribe el contenido del archivo. Usa `>>` para añadir al final sin borrar el contenido._

**Crea un archivo llamado `notas.txt` y añade algunas líneas de texto:**

```bash
echo -e "Línea 1\nLínea 2\nLínea 3" > ~/notas.txt
```

**Copia el archivo `documento.txt` a un nuevo archivo llamado `copia_documento.txt`:**

```bash
cp ~/documento.txt ~/copia_documento.txt
```

**Renombra el archivo `copia_documento.txt` a `documento_renombrado.txt`:**

```bash
mv ~/copia_documento.txt ~/documento_renombrado.txt
mv -i ~/copia_documento.txt ~/documento_renombrado.txt
```

_`-i` significa "interactive" (interactivo) y te pedirá confirmación si el archivo de destino ya existe._

**Copia el archivo ejecutable `script.py` preservando permisos a un nuevo archivo llamado `script_backup.py`:**

```bash
cp -p ~/script.py ~/script_backup.py
```

_`-p` significa "preserve" (preservar) y mantiene los permisos, propietario y marcas de tiempo del archivo original._

_Si copias un archivo ejecutable o una clave SSH sin `-p`, podrías perder los permisos de ejecución o las propiedades originales._

**Elimina el archivo `documento.txt`:**

```bash
rm ~/documento.txt
```

**Lista los archivos en tu directorio personal para verificar que `documento_renombrado.txt` existe:**

```bash
ls ~/
```

**Elimina la carpeta `assets` y todo su contenido de forma recursiva:**

```bash
rm -r ~/proyecto/assets
```

**Elimina el directorio `proyecto`:**

```bash
rmdir ~/proyecto
```

_`rmdir` solo funciona si el directorio está vacío. Si no lo está, usa `rm -r`._

## Visualización de Contenido y Manipulación de Archivos

**Muestra el contenido del archivo `notas.txt` usando el comando `cat`:**

```bash
cat ~/notas.txt
```

**\*Visualiza el contenido de archivo grandes del sistema como `/var/log/syslog` o `/var/log/auth.log` página a página:**

```bash
less /var/log/syslog
less /var/log/auth.log
```

**Muestra las primeras dos líneas del archivo `notas.txt`:**

```bash
head -n 2 ~/notas.txt
```

**Muestra las últimas dos líneas del archivo `notas.txt`:**

```bash
tail -n 2 ~/notas.txt
```

**Cuenta el número de líneas en el archivo `notas.txt`:**

```bash
wc -l ~/notas.txt
```

**Limpia el contenido del archivo `notas.txt`:**

```bash
> ~/notas.txt
```

**Verifica que el archivo `notas.txt` está vacío mostrando su contenido:**

```bash
cat ~/notas.txt
```

**Elimina el archivo `notas.txt`:**

```bash
rm ~/notas.txt
```

**Verifica que el archivo `notas.txt` ha sido eliminado:**

```bash
ls ~/notas.txt
```

**Crea un archivo llamado `datos.txt` con varias líneas de texto:**

```bash
echo -e "dato1\ndato2\ndato3\ndato4\ndato5" > ~/datos.txt
```

**Busca la línea que contiene "dato3" en el archivo `datos.txt`:**

```bash
grep "dato3" ~/datos.txt
```

## Wildcards y Globbing

_Dentro del directorio personal (`~`):_

**Encuentra todos los .txt:**

```bash
find -name "*.txt"
```

**Lista todos los archivos `.py`:**

```bash
ls *.py
```

**Lista todos los archivos que comienzan con "doc" y terminan con ".txt":**

```bash
ls doc*.txt
```

**Lista todas las imágenes foto1.jpg, foto2.jpg, fotoA.jpg, ..., pero NO foto10.jpg:**

```bash
ls foto?.jpg
```

**Lista solo los logs que terminen en un número del 0 al 9 de la forma log_0.txt, log_1.txt, ..., log_9.txt:**

```bash
ls log_[0-9].txt
```

**Crea varios archivos (file1.txt, file2.txt, file3.txt, file4.txt, file5.txt) de una sola vez:**

```bash
touch file{1..5}.txt
```

**Crea dentro de la carpeta `proyecto`, varios directorios (`src`, `bin`, `lib`, `docs`) de una sola vez:**

```bash
mkdir -p proyecto/{src,bin,lib,docs}
```

**Imagina que tienes una carpeta llena de archivo `.txt`, `.jpg`, `.png` y `.py`. Quieres borrar todo menos los scripts de Python. ¿Qué comando usarías?:**

```bash
rm ^*.py
```

## Observar logs

**Muestra las últimas 5 líneas del archivo de log del sistema `/var/log/syslog`:**

```bash
tail -n 5 /var/log/syslog
```

**Muestra las nuevas entradas en tiempo real del archivo de log del sistema `/var/log/syslog`:**

```bash
tail -f /var/log/syslog
```
