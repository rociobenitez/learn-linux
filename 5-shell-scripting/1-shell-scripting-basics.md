# Shell Scripting

Un **script de shell** es un archivo de texto ejecutable que contiene una serie de comandos que el intérprete de comandos (shell) puede ejecutar.

La primera línea suele tener la forma de una directiva de interpretación _(interpreter directive)_. También es conocida como **shebang** y comienza con `#!`, seguida de la ruta del intérprete que se utilizará para ejecutar el script.

La sintaxis es:

```bash
#!interpreter [optional-arg]
```

- `interpreter`: La ruta absoluta del intérprete de comandos (programa ejecutable).
- `optional-arg`:
  - Un argumento opcional que se pasa al intérprete.
  - Es una cadena (string) que representa un único argumento.

Por ejemplo:

```bash
#!/bin/bash  # script debe ser ejecutado con intérprete de bash
#!/bin/sh # script debe ser ejecutado con intérprete de shell
```

Para un script de Python, la primera línea podría ser:

```bash
#!/usr/bin/env python3
```

Los scripts de shell se utilizan para:

- automatizar tareas repetitivas
- administrar sistemas
- realizar operaciones complejas de manera eficiente

## Crear y ejecutar un script de shell

### Crea un archivo

Crea un archivo de texto con un editor de texto, por ejemplo `mi_script.sh`.

```bash
touch mi_script.sh
```

`.sh` es una convención común para los scripts de shell, pero no es obligatorio.

### Añade la línea shebang al principio del archivo

```bash
echo "#! /bin/bash" >> mi_script.sh
```

### Escribe los comandos que deseas ejecutar en el script

```bash
echo "echo Hola, mundo" >> mi_script.sh
```

Guarda el archivo.

Puedes comprobar los **permisos** del script:

```bash
ls -l mi_script.sh
```

Ejemplo de salida:

```bash
-rw-r--r-- 1 usuario usuario 34 jun 10 12:00 mi_script.sh
```

### Dale permisos de ejecución al script usando `chmod`

```bash
chmod +x mi_script.sh
```

Puedes verificar los permisos nuevamente:

```bash
ls -l mi_script.sh
```

Ejemplo de salida:

```bash
-rwxr-xr-x 1 usuario usuario 34 jun 10 12:00 mi_script.sh
```

### Ejecuta el script

```bash
./mi_script.sh
```

## Programación de trabajos con cron

`cron` es un servicio de Linux que permite programar la ejecución automática de tareas (scripts o comandos) en intervalos regulares.

**Abrir el editor de crontab:**

```bash
crontab -e
```

**Sintaxis de programación de trabajos:**

```
m h dom mon dow command
```

- `m`: Minuto (0-59)
- `h`: Hora (0-23)
- `dom`: Día del mes (1-31)
- `mon`: Mes (1-12)
- `dow`: Día de la semana (0-7) (0 y 7 representan el domingo)
- `command`: Comando o script a ejecutar

> Puedes usar `*` para indicar "cualquiera".

**Agregar la fecha/hora a un archivo todos los domingos a las 6:15 pm:**

```bash
15 18 * * 0 echo "Fecha y hora: $(date)" >> /ruta/al/archivo.txt
```

**Ejecutar un script de shell en el primer minuto del primer día de cada mes:**

```bash
1 0 1 * * /ruta/a/mi_script.sh
```

**Realiza una copia de seguridad de tu directorio personal todos los lunes a las 3:00 am:**

```bash
0 3 * * 1 tar -czf /ruta/de/backup/home_backup_
```

**Desplegar la tarea cron programada:** Cerrar el editor de crontab y guardar el archivo.

**Ver las tareas cron programadas _(verificar)_:**

```bash
crontab -l
```

> Si no hay tareas programadas, verás un mensaje indicando que no hay crontab para el usuario actual.

**Borrar todas las tareas cron programadas:**

```bash
crontab -r
```

> **Advertencia:** Esto eliminará todas las tareas cron programadas para el usuario actual sin pedir confirmación.

## Cheatsheet de comandos útiles en scripts de shell

| Comando                                    | Descripción                                                                                            |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| `#!/bin/bash`                              | Línea que se usa al inicio de un script para indicar que debe ser ejecutado con el intérprete de bash. |
| `#!/bin/sh`                                | Línea que se usa al inicio de un script para indicar que debe ser ejecutado con el intérprete de sh.   |
| `which bash`                               | Muestra la ruta absoluta del intérprete de bash en el sistema.                                         |
| `ls \| sort -r`                            | Lista los archivos y los ordena en orden inverso.                                                      |
| `cut -d “,” -f1 names.csv \| sort \| uniq` | Extrae la primera columna de un archivo CSV, ordena los valores y elimina duplicados.                  |
| `echo $mi_variable`                        | Muestra el valor de la variable `mi_variable`.                                                         |
| `read variable`                            | Lee una entrada del usuario y la almacena en la variable `variable`.                                   |
| `env`                                      | Muestra todas las variables de entorno actuales.                                                       |
| `export VARIABLE=valor`                    | Establece una variable de entorno llamada `VARIABLE` con el valor `valor`.                             |

| Metacaracter | Ejemplo                      | Descripción                                                                                                                            |
| ------------ | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `#`          | `# Comentario`               | Indica un comentario en el script. Todo lo que siga a partir de este carácter en la línea será ignorado.                               |
| `;`          | `echo 'Hola'; ls`            | Permite separar múltiples comandos en una sola línea.                                                                                  |
| `*`          | `ls *.json`                  | Comodín que representa cero o más caracteres en nombres de archivos o patrones.                                                        |
| `?`          | `ls file?.txt`               | Comodín que representa un solo carácter en nombres de archivos o patrones.                                                             |
| `\`          | `echo "Hola\ Mundo"`         | Carácter de escape que permite incluir caracteres especiales en cadenas de texto.                                                      |
| `$`          | `echo $VARIABLE`             | Se utiliza para referirse al valor de una variable.                                                                                    |
| `"`          | `echo "Hola $VARIABLE"`      | Comillas dobles que permiten la expansión de variables y la interpretación de caracteres especiales dentro de la cadena.               |
| `'`          | `echo 'Hola $VARIABLE'`      | Comillas simples que tratan todo el contenido literalmente, **sin expansión de variables ni interpretación de caracteres especiales**. |
| `` ` ``      | `` echo `date`  ``           | Comillas invertidas que permiten ejecutar un comando y capturar su salida para usarla en el script.                                    |
| `$( )`       | `echo $(date)`               | Similar a las comillas invertidas, permite ejecutar un comando y capturar su salida de manera más legible y anidada.                   |
| `\|`         | `ls \| grep "archivo"`       | Pipe que redirige la salida de un comando como entrada a otro comando.                                                                 |
| `>`          | `echo "Hola" > archivo.txt`  | Redirige la salida estándar de un comando a un archivo, sobrescribiendo su contenido.                                                  |
| `>>`         | `echo "Hola" >> archivo.txt` | Redirige la salida estándar de un comando a un archivo, **añadiendo** al final del archivo.                                            |
| `<`          | `command < input.txt`        | Redirige la entrada estándar de un comando desde un archivo.                                                                           |
| `&&`         | `command1 && command2`       | Ejecuta `command2` solo si `command1` se ejecuta correctamente (retorna 0).                                                            |
| `\|\|`       | `command1 \|\| command2`     | Ejecuta `command2` solo si `command1` falla (retorna un valor distinto de 0).                                                          |
