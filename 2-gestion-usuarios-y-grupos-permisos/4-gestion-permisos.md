# Gestión de permisos en Linux

## Permisos Linux

En Linux, los permisos o derechos que los usuarios pueden tener sobre determinados archivos se establecen en tres niveles claramente diferenciados. Estos tres niveles son los siguientes:

- Permisos del propietario
- Permisos del grupo
- Permisos del resto de usuarios (o también llamados “otros”)

En los sistemas en red siempre existe la figura del **administrador, superusuario o “root”**.

Es el encargado de crear y dar de baja a usuarios, así como también, de establecer los privilegios (permisos o derechos) que cada usuario tendrá sobre los archivos del sistema.

Estos privilegios se establecen tanto para el directorio `home` de cada usuario como para los directorios y archivos a los que el administrador decida que el usuario pueda acceder. Adicionalmente también se puede establecer para recursos a los que pueda acceder un usuario, como disco externo, impresoras, etc.

### Permisos del propietario

El **propietario** es aquel usuario que genera o crea un `archivo/directorio` dentro de su directorio de trabajo (HOME), o en algún otro directorio sobre el que tenga permiso. Cada usuario tiene la potestad de crear, por defecto, los archivos que quiera dentro de su directorio de trabajo. En principio, él y solamente él será el que tenga acceso a la información contenida en los archivos y directorios que hay en su directorio HOME.

### Permisos del grupo

Como hemos visto en los apartados previos, cada usuario pertenece a un grupo de trabajo. De esta forma, cuando se gestiona un grupo, se gestionan todos los usuarios que pertenecen a éste. Es decir, es más fácil integrar varios usuarios en un grupo al que se le conceden determinados privilegios en el sistema, que asignar los privilegios de forma independiente a cada usuario.

### Permisos del resto de usuarios (otros)

Los privilegios de los archivos o recursos, también pueden tenerlos **otros usuarios que no pertenezcan al grupo de trabajo del usuario propietario**, sino que pertenecen a otros grupos. A estos se les denomina **“resto de usuarios del sistema”**.

## Asignación de permisos

En Linux, los permisos se asignan utilizando una combinación de letras y números. Los permisos básicos son:

| Permiso       | Letra | Valor numérico | Para archivos                                   | Para directorios                                                    |
| ------------- | ----- | -------------- | ----------------------------------------------- | ------------------------------------------------------------------- |
| **Lectura**   | r     | 4              | Permite, fundamentalmente, visualizar contenido | Permite listar los archivos contenidos en el directorio             |
| **Escritura** | w     | 2              | Permite modificar o eliminar el contenido       | Permite crear, eliminar o renombrar archivos dentro del directorio  |
| **Ejecución** | x     | 1              | Permite ejecutar un archivo                     | Permite acceder a un directorio y realizar operaciones dentro de él |

> [!NOTE] > **Si no se dispone del permiso de ejecución:**
>
> - No se podrá acceder a dicho directorio (aunque utilicemos el comando “cd”), ya que esta acción será denegada.
> - Se podrá ver su contenido (si se cuenta con permiso de lectura), pero no se podrá acceder a ninguno de los objetos contenidos en él.

Los permisos se representan en tres conjuntos de tres caracteres cada uno, correspondientes al propietario, al grupo y a otros usuarios.

Por ejemplo, `rwxr-xr--` indica que:

- el propietario tiene permisos de lectura, escritura y ejecución
- el grupo tiene permisos de lectura y ejecución
- y otros usuarios tienen solo permisos de lectura

Cada archivo queda identificado por **10 caracteres**, los 9 primeros indican los permisos (3 caracteres para el propietario, 3 para el grupo y 3 para otros usuarios) y el **primer carácter** indica el **tipo de archivo**:

| Carácter | Tipo de archivo        |
| -------- | ---------------------- |
| `-`      | archivo normal/regular |
| `d`      | directorio             |
| `b`      | archivo de bloque      |
| `c`      | archivo de caracteres  |
| `l`      | enlace simbólico       |
| `p`      | tubería con nombre     |
| `s`      | socket                 |

Cada uno de estos bloques de 3 caracteres, referidos a propietario, grupo y otros usuarios definen los siguientes permisos:

| Permiso | Descripción                               | Octal | Binario |
| ------- | ----------------------------------------- | ----- | ------- |
| `---`   | Sin permisos                              | 0     | 000     |
| `r--`   | Permiso de lectura                        | 4     | 100     |
| `-w-`   | Permiso de escritura                      | 2     | 010     |
| `--x`   | Permiso de ejecución                      | 1     | 001     |
| `rw-`   | Permiso de lectura y escritura            | 6     | 110     |
| `r-x`   | Permiso de lectura y ejecución            | 5     | 101     |
| `-wx`   | Permiso de escritura y ejecución          | 3     | 011     |
| `rwx`   | Permiso de lectura, escritura y ejecución | 7     | 111     |

De forma general, se establecen por defecto los siguientes permisos:

| Permiso     | Descripción      | Octal | Significado                                                                                      |
| ----------- | ---------------- | ----- | ------------------------------------------------------------------------------------------------ |
| `rw-r--r--` | Para ficheros    | 664   | El propietario puede leer y escribir, el grupo y otros usuarios solo pueden leer                 |
| `rwxr-xr-x` | Para directorios | 755   | El propietario puede leer, escribir y ejecutar, el grupo y otros usuarios pueden leer y ejecutar |

## Comando `umask`

Se utiliza para saber la máscara por defecto que tiene un usuario.

El valor de `umask` se resta de los permisos máximos posibles para determinar los permisos finales.

```bash
usuario@maquina:~$ umask
0022
```

Por defecto, el valor de `umask` suele ser `022`, lo que significa que los nuevos archivos tendrán permisos `644` y los nuevos directorios tendrán permisos `755`.

```bash
usuario@maquina:~$ umask -S
u=rwx,g=rx,o=rx
```

Con `-S` se muestra la máscara en notación simbólica.

**Para cambiar la máscara por defecto:**

```bash
umask 027
```

Esto establecerá la máscara a `027`, lo que significa que los nuevos archivos tendrán permisos `640` y los nuevos directorios tendrán permisos `750`.

**Crear un archivo con esta nueva máscara:**

```bash
touch archivo_ejemplo.txt
ls -l archivo_ejemplo.txt
```

Salida:

```
-rw-r----- 1 usuario usuario 0 fecha archivo_ejemplo.txt
```

> El valor de `umask` se puede establecer en `/etc/login.defs` o en los archivos de configuración del shell del usuario (como `.bashrc` o `.profile`) para que afecte a todos los usuarios del sistema.

## Comandos para asignación de permisos

### `chmod`

El comando `chmod` _(change mode)_ se utiliza para cambiar los permisos de archivos y directorios en Linux.

Si no se especifica el tipo de usuario al que queremos quitar, poner o asignar privilegios, lo que sucederá al realizar la operación es afectar a todos los usuarios (propietario, grupo y otros) simultáneamente.

| Parámetro | Nivel | Descripción                                  |
| --------- | ----- | -------------------------------------------- |
| `u`       | User  | Afecta al propietario del archivo/directorio |
| `g`       | Group | Afecta al grupo del archivo/directorio       |
| `o`       | Other | Afecta a otros usuarios del sistema          |

La sintaxis general de `chmod` es:

```bash
chmod permisos directorio/fichero/s
```

Ejemplos prácticos:

**Dar permiso de ejecución al propietario:**

```bash
chmod u+x archivo.txt
```

**Quitar permiso de ejecución a todos los usuarios:**

```bash
chmod a-x script.sh
```

**Dar permiso de lectura y escritura a los demás usuarios:**

```bash
chmod o+rw archivo.txt
```

**Dejar solo permiso de lectura al grupo al que pertenece el archivo:**

```bash
chmod g+r-w-x archivo.txt
```

Hay otra forma de utilizar el comando `chmod` que, para mucho usuarios, resulta "más cómoda", aunque a priori sea algo más compleja de entender, que es mediante la notación octal.

La **combinación de valores** de cada grupo de usuarios forma un número octal, el bit "x" es decir 1, el bit "w" es decir 2 y el bit "r" es decir 4. Tenemos entonces:

- `r = 4`
- `w = 2`
- `x = 1`

### Suma de los bits con permisos

La combinación de bits “con permiso” (1) o “sin permiso” (0) en cada grupo da ocho posibles combinaciones de valores, es decir la suma de los bits con permisos:

| Permisos | Valor Octal | Descripción                               |
| -------- | ----------- | ----------------------------------------- |
| `---`    | 0           | Sin permisos                              |
| `--x`    | 1           | Permiso de ejecución                      |
| `-w-`    | 2           | Permiso de escritura                      |
| `-wx`    | 3           | Permiso de escritura y ejecución          |
| `r--`    | 4           | Permiso de lectura                        |
| `r-x`    | 5           | Permiso de lectura y ejecución            |
| `rw-`    | 6           | Permiso de lectura y escritura            |
| `rwx`    | 7           | Permiso de lectura, escritura y ejecución |

Cuando se combinan los permisos del usuario, grupo y otros, se obtienen un número de tres cifras que conforman los permisos del archivo o del directorio.

Por ejemplo, si queremos asignar los permisos `rwxr-xr--`, la combinación de valores sería:

- Propietario: `rwx` = 4 + 2 + 1 = 7
- Grupo: `r-x` = 4 + 0 + 1 = 5
- Otros: `r--` = 4 + 0 + 0 = 4

**Ejemplos:**

| Permiso     | Valor | Descripción                                                                                                                       |
| ----------- | ----- | --------------------------------------------------------------------------------------------------------------------------------- |
| `rw-------` | 600   | El propietario tiene permisos de lectura y escritura, el grupo y otros usuarios no tienen ningún permiso.                         |
| `rwx--x--x` | 711   | El propietario tiene todos los permisos, el grupo y otros usuarios solo tienen permiso de ejecución.                              |
| `rwxr-xr-x` | 755   | El propietario tiene todos los los permisos, el grupo y otros usuarios tienen permisos de lectura y ejecución.                    |
| `rwxrwxrwx` | 777   | Todos los usuarios tienen todos los permisos.                                                                                     |
| `r--------` | 400   | Solo el propietario tiene permiso de lectura.                                                                                     |
| `rw-r-----` | 640   | El propietario tiene permisos de lectura y escritura, el grupo tiene permiso de lectura, otros usuarios no tienen ningún permiso. |

### Bits de permisos especiales

Además de los permisos básicos, existen tres bits de permisos especiales que pueden ser asignados a archivos y directorios:

| Bit Especial       |                                 | Descripción                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Asignar este bit                | Quitar este bit                 |
| ------------------ | ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- | ------------------------------- |
| **Setuid (s)**     | Bit de SUID (Set User ID)       | Cuando se asigna a un archivo ejecutable, permite que **el programa se ejecute con los privilegios del propietario** del archivo, en lugar de los del usuario que lo ejecuta.                                                                                                                                                                                                                                                                                        | `chmod u+s fichero`             | `chmod u-s fichero`             |
| **Setgid (s)**     | Bit de SGID (Set Group ID)      | Cuando se asigna a un archivo ejecutable, permite que **el programa se ejecute con los privilegios del grupo** del archivo. Cuando se asigna a un directorio, los archivos creados dentro del directorio heredan el grupo del directorio en lugar del grupo del usuario que los crea.                                                                                                                                                                                | `chmod g+s /carpeta_compartida` | `chmod g-s /carpeta_compartida` |
| **Sticky bit (t)** | Bit de permisos de persistencia | Cuando se asigna a un directorio, permite que **solo el propietario del archivo o el usuario root puedan eliminar o renombrar archivos** dentro de ese directorio. Es comúnmente utilizado en directorios compartidos como `/tmp`.<br>Suele asignarse en directorios a los que todos los usuarios tienen acceso. Permite evitar que un usuario pueda borrar ficheros/directorios de otro usuario dentro de ese directorio, ya que todos tienen permiso de escritura. | `chmod o+t /directorio`         | `chmod o-t /directorio`         |

> [!NOTA] **Debemos utilizar el bit Setuid con extremo cuidado** ya que puede provocar una escalada de privilegios en nuestro sistema.

## Comandos para cambiar el propietario y grupo de ficheros/directorios

### `chown`

El comando `chown` _(change owner)_ se utiliza para cambiar el propietario y/o el grupo de un archivo o directorio.

La sintaxis general de `chown` es:

```bash
chown [opciones] nuevo_propietario[:nuevo_grupo] archivo/directorio
```

**Si no tenemos los privilegios necesarios, debemos usar `sudo` para ejecutar el comando con permisos de superusuario.**

```bash
usuario@maquina:~$ chown root archivo.txt
chown: changing ownership of 'archivo.txt': Operation not permitted
```

**Ejemplos prácticos:**

| Acción                                                                         | Comando                                |
| ------------------------------------------------------------------------------ | -------------------------------------- |
| Establecer a **root** como propietario de un archivo                           | `sudo chown root archivo.txt`          |
| Cambiar el **propietario** a todos los archivos y subcarpetas de un directorio | `chown -R usuario1 /directorio`        |
| Podemos añadir la opción `-c` para mostrar los cambios realizados              | `chown -R -c usuario1 /directorio`     |
| Cambiar el **propietario** de un archivo                                       | `chown usuario1 archivo.txt`           |
| Cambiar el **grupo** de un archivo                                             | `chown :grupo1 archivo.txt`            |
| Cambiar **propietario y grupo** de un archivo                                  | `chown usuario1:grupo1 archivo.txt`    |
| Cambiar **propietario y grupo** de un directorio y su contenido                | `chown -R usuario1:grupo1 /directorio` |
| Cambiar **usuario** de los archivos y carpetas del directorio actual                | `chown -R usuario1 .`                  |
| Para dar todos lo permisos a todos los directorios y archivos | `chmod -R 777 /directorio`               |
| El modificador `v` nos informará de los permisos aplicados | `chmod -R -v 777 /directorio`            |

> El comando `chown`, usado de forma recursiva con la opción `-R`, modifica el propietario de todos los archivos y subdirectorios dentro del directorio especificado, dejando el directorio principal sin cambios de propietario.
