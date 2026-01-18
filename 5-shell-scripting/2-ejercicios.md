# Ejercicios de Scripting en Bash

### Ejercicio 1: Constantes y atributos de variables

1. Asigna a la variable `SSOO` un número aleatorio y verifica.
2. Asigna otro número aleatorio y verifica.
3. Cambia los atributos de SSOO a de solo lectura.
4. Intenta cambiar el valor de SSOO (asigna un nuevo número aleatorio). ¿Qué ocurre?

### Ejercicio 2: Variables de entorno

Crear un script llamado `info_sistema.sh` que utilice variables de entorno para mostrar la siguiente información del sistema:

- Nombre del usuario actual.
- Nombre del host.
- Directorio home del usuario.
- La shell utilizada por el usuario.

Debes crear variables locales que contengan la siguiente información:

- Variable `HORA_ACTUAL` que almacene la hora actual en formato HH:MM:SS.
- Variable `FECHA_ACTUAL` que almacene la fecha actual en formato DD/MM/AAAA.
- Variable `DIA_SEMANA` que almacene el día de la semana (por ejemplo, Lunes, Martes, etc.).

Toda la información debe guardarse en un fichero llamado `sistema_info.txt` en el directorio home del usuario.

### Ejercicio 3: Parámetros posicionales

Crea un script llamado `positional_params.sh` de la siguiente forma:

```bash
#!/bin/bash

# Script que muestra el uso de parámetros posicionales
echo "Nombre del script: $0"
echo "Introduce tu nombre: $1" # 1º argumento
echo "Introduce tu edad: $2"   # 2º argumento
echo "Número total de argumentos: $#"
echo "Todos los argumentos como una sola cadena: $*"
echo "Todos los argumentos como una lista: $@"
```

### Ejercicio 4: Uso de `read`

Crea el script `datos_personales.sh` que solicite al usuario su nombre, apellido, edad y estudios finalizados. Guarda la información en un archivo `informacion_usuario.txt` y muestra un mensaje de confirmación ("La información ha sido guardada correctamente en el archivo: informacion_usuario.txt"). Se deberá mostrar en pantalla el contenido del fichero donde se halla almacenado la información introducida.

### Ejercicio 5: Visibilidad de variables y export

Crea el `script1.sh`:

```bash
#!/bin/bash
MYVAR="Hola desde script1"
export MYVAR

# Ejecutar script2.sh
./script2.sh
```

Crea el `script2.sh`:

```bash
#!/bin/bash
echo "El valor de MYVAR en script2 es: $MYVAR"
```

> Ojo con los permisos de ejecución de los scripts (`chmod +x script1.sh script2.sh`).

Después verifica con `echo $MYVAR` en la terminal. ¿Qué sucede?

Ejecuta:

```bash
./script1.sh
```

Vuelve a verificar con `echo $MYVAR` en la terminal. ¿Qué sucede ahora? Explica por qué. 

Ejecuta el comando `export`. Explícalo.

### Ejercicio 6: Operaciones aritméticas

Crea un script que pida dos valores numéricos de entrada y realice las siguientes operaciones, mostrando el resultado:
- Suma
- Resta
- Multiplicación (producto)
- División entera
- Potencia

### Ejercicio 7: Monitorización del sistema

Crea un script llamado `monitor_sistema.sh`que:
1. Muestre un mensaje **estructurado** y claro en pantalla con el nombre del **usuario actual y el sistema operativo utilizado**. También debe indicar el **shell** que está utilizando.
2. Utilizando variables locales, muestra en pantalla a continuación un mensaje estructurado que contenga la siguiente información:
    - Uso actual de la CPU y memoria RAM total y libre,
    - en porcentaje
    - y únicamente lo solititado.
3. Toda la información obtenida debe guardarse en un fichero llamado `monitor_info.txt`.
4. El script debe pedir al usuario (a través de parámetro posicional) su sistema operativo preferido (Linux, Windows, MacOS, etc.) y mostrar un mensaje personalizado con la respuesta.