# Cheatsheet Shell Scripting

## Variables

```bash
VAR_NAME="value"           # Asignación

echo $VAR_NAME             # Acceso al valor
echo ${VAR_NAME}           # Acceso al valor

echo ${#VAR_NAME}          # Longitud del valor

echo '$VAR_NAME'           # Comillas simples: no expande variables
echo "$VAR_NAME"           # Comillas dobles: expande variables
echo "${VAR_NAME}_suffix"  # Concatenación

unset VAR_NAME             # Eliminar variable
```

## `declare`

`declare` se utiliza para definir atributos y tipos de variables en bash.

**Sintaxis:**

```bash
declare [opciones] NOMBRE[=VALOR] ...
```

```bash
declare -i INT_VAR         # Variable entera (integer)
declare -a ARRAY_VAR       # Array indexado
declare -A ASSOC_ARRAY     # Array asociativo
declare -f FUNC_NAME       # Función
declare -p VAR_NAME        # Muestra atributo y valor de la variable (para depuración)
declare -r CONST_VAR       # Variable constante (solo lectura - read-only)
declare -x EXPORT_VAR      # Variable exportada (disponible para subprocesos) (environment variable)
```

## `awk` para manipulación de texto

`awk` permite filtrar, manipular y transformar líneas y columnas de datos de manera eficiente.

Permite **analizar** y **extraer** información de archivos de texto estructurados en columnas.

**Sintaxis:**

```bash
awk 'patron {acción}' archivo
```

```bash
awk '{print $1}' file.txt               # Imprime la 1ª columna
awk -F, '{print $2}' file.csv           # Usa coma como separador e imprime la 2ª columna
awk -F: '{print $3, $1}' /etc/passwd    # UID y nombre de usuario del archivo passwd
awk -F: '{print NF}' /etc/passwd        # Número de campos en cada línea

awk '/pattern/ {print $0}' file.txt                 # Imprime líneas que coinciden con el patrón
awk -F: '$7 == "/bin/bash" {print $1}' /etc/passwd  # Usuarios con shell bash
awk -F: '$3 > 1000 {print $1}' /etc/passwd          # Usuarios con UID > 1000
awk -F: '$3 == 0 {print NF}' /etc/passwd            # Número de campos para el usuario root
awk '{sum += $1} END {print sum}' file.txt          # Suma la 1ª columna
```

## Parametros posicionales

```bash
$0        # Nombre del script
$1, $2... # Argumentos del script
$#        # Número de argumentos pasados al script
$*        # Todos los argumentos como una sola cadena
$@        # Todos los argumentos como una lista separada
$?        # Valor de retorno del último comando ejecutado
$$        # PID del script actual
$         # PID del script en ejecución
$!        # PID del último proceso en segundo plano
```

## `read`

Se utiliza para leer la entrada del usuario desde la terminal y almacenar esa entrada en una o más variables.

```bash
read VAR_NAME                              # Lee una línea y la asigna a VAR_NAME
read -p "Prompt: " VAR_NAME                # Muestra un prompt antes de leer
read -a ARRAY_NAME                         # Lee una línea y la divide en un array
read -t 5 -p "Introduce un valor: " DATO   # Tiempo de espera de 5 segundos
read -r RUTA_NAME                          # No interpreta barras invertidas
read -s VAR_NAME                           # Modo silencioso (no muestra entrada)
read -e COMANDO                            # Habilita edición de línea
read -n 1 -p "Pulsa una tecla: " VAR_NAME  # Lee solo 1 carácter
read -d ";" VAR_NAME                       # Lee hasta el delimitador ";"
read -d '' VAR_NAME < file.txt             # Lee hasta EOF (útil para archivos)
read -u 3 LINEA                            # Lee desde el descriptor de archivo 3
```

## Sustitución de Comandos y visibilidad de variables

```bash
VAR_NAME=`comando`        # Alternativa para asignar la salida de un comando
echo $VAR_NAME            # Muestra el valor de la variable

VAR_NAME=$(comando)       # Asigna la salida de un comando a una variable
[command] ${VAR_NAME}     # Usa la variable en un comando
```

Ejemplos:

```bash
MY_DIR=`pwd`
echo "El directorio actual es: $MY_DIR"
```

```bash
CURR_DIR=$(pwd)
ls -la ${CURR_DIR}
```

### `export`

```bash
export VAR_NAME          # Exporta la variable al entorno de subprocesos
export VAR_NAME="value"  # Asigna y exporta la variable
```

Una variable declarada dentro de un script solor es visible dentro de ese script. Para que una variable sea accesible por otros scripts o procesos hijos, debe ser exportada usando `export`.

Para que una variable definida en un script sea visible en el shell principal (entorno actual de la terminal), el script debe ejecutarse usando `source script.sh` o `. script.sh`.

```bash
source script.sh   # O bien
. script.sh
```

## Operadores en Shell Scripting

| Operador | Descripción                          |
| -------- | ------------------------------------ |
| `+`      | Suma                                 |
| `-`      | Resta                                |
| `*`      | Multiplicación                       |
| `/`      | División                             |
| `**`     | Exponenciación                       |
| `%`      | Módulo (resto de la división)        |
| `=`      | Asignación de valor a una variable   |
| `==`     | Comparación de igualdad (cadenas)    |
| `-eq`    | Comparación de igualdad (números)    |
| `-ne`    | Comparación de desigualdad (números) |
| `!=`     | Comparación de desigualdad (cadenas) |
| `-lt`    | Menor que (números)                  |
| `-le`    | Menor o igual que (números)          |
| `-gt`    | Mayor que (números)                  |
| `-ge`    | Mayor o igual que (números)          |
| `-=`     | Menos-igual (números)                |
| `+=`     | Más-igual (números)                  |
| `*=`     | Por-igual (números)                  |
| `/=`     | Dividido-igual (números)             |
| `%=`     | Módulo-igual (números)               |
| `--`     | Decremento (números)                 |
| `++`     | Incremento (números)                 |

Una de las formas de evaluar o ejecutar operaciones aritméticas en bash es utilizando la construcción `(( ))`:

```bash
(( EXPRESIÓN_A + EXPRESIÓN_B ))
```

Precedida por el símbolo `$` para asignar el resultado a una variable:

```bash
RESULTADO=$(( 5 + 3 * 2 ))
echo $RESULTADO  # Salida: 11
```

### Operador `bc` _(Basic Calculator)_

`bc` es una calculadora de precisión arbitraria que se utiliza en scripts de shell para realizar operaciones aritméticas más complejas, incluyendo números decimales.

**Sintaxis:**

```bash
echo "expresion" | bc [-opciones]
```

Por defecto, `bc` trabaja con números enteros. **Para trabajar con números decimales**, se debe utilizar la opción `-l` o la sentencia `scale` dentro de la expresión:

```bash
echo "3.5 + 2.1" | bc -l        # Resultado: 5.6
echo "2^3" | bc -l              # Potenciación: 8
echo "sqrt(16)" | bc -l         # Raíz cuadrada: 4

echo "scale=2; 10 / 3" | bc -l  # Resultado con 2 decimales
```

_La **opción `-l`** (permite trabajar con 20 decimales de precisión)._

Se pueden realizar varias operaciones en el mismo comando separándolas con punto y coma `;`:

```bash
echo "scale=2; 10 / 3; 5 * 2.5" | bc -l
```

### Comparaciones y condicionales

```bash
echo "5 > 3" | bc        # Salida: 1 (verdadero)
echo "5 < 3" | bc        # Salida: 0 (falso)
echo "5 == 5" | bc       # Salida: 1 (verdadero)
echo "5 != 3" | bc       # Salida: 1 (verdadero)
```

```bash
echo "5 & 3" | bc        # AND bit a bit
echo "5 | 2" | bc        # OR bit a bit
echo "5 ^ 3" | bc        # XOR bit a bit
```

### `test`

`test` se utiliza para evaluar expresiones condicionales en scripts de shell.

Devuelve **valor 0** (verdadero) si la expresión es cierta y **valor 1** (falso) si es falsa.

```bash
test EXPRESIÓN
```

```bash
# Comprobación de archivos y directorios
test -e archivo.txt              # Verifica si el archivo o directorio existe
test -f archivo.txt              # Verifica si el archivo existe y es un archivo regular
test -d /ruta/del/directorio     # Verifica si el directorio existe
test -r archivo.txt              # Verifica si el archivo es legible
test -w archivo.txt              # Verifica si el archivo es escribible
test -x script.sh                # Verifica si el archivo es ejecutable
test -l enlace_simbolico         # Verifica si el archivo es un enlace simbólico
test -s archivo.txt              # Verifica si el archivo no está vacío

# Comparación de cadenas
test -z "$VAR_NAME"              # Verifica si la variable está vacía
test -n "$VAR_NAME"              # Verifica si la variable no está vacía
test "$VAR1" = "$VAR2"           # Compara si dos cadenas son iguales
test "$VAR1" != "$VAR2"          # Compara si dos cadenas son diferentes

# Comparación numérica
test $NUM1 -eq $NUM2             # Compara si dos números son iguales
test $NUM1 -ne $NUM2             # Compara si dos números son diferentes
test $NUM1 -lt $NUM2             # Verifica si NUM1 es menor que NUM2
test $NUM1 -le $NUM2             # Verifica si NUM1 es menor o igual que NUM2
test $NUM1 -gt $NUM2             # Verifica si NUM1 es mayor que NUM2
test $NUM1 -ge $NUM2             # Verifica si NUM1 es mayor o igual que NUM2
```

Ejemplos:

```bash
test 6 -gt 3         # Verdadero (0)
test 2 -lt 1         # Falso (1)
test -f /etc/passwd  # Verdadero si el archivo existe
test -f /etc         # Falso si el archivo no existe
```

## Estructuras de Control

### Estructura `if`

```bash
if [ CONDICIÓN ]; then
    # Código si la condición es verdadera
elif [ OTRA_CONDICIÓN ]; then
    # Código si la otra condición es verdadera
else
    # Código si ninguna condición es verdadera
fi
```

Ejemplo:

```bash
if [ $NUM -gt 0 ]; then
    echo "El número es positivo"
elif [ $NUM -lt 0 ]; then
    echo "El número es negativo"
else
    echo "El número es cero"
fi
```

Uso de `test` con `if`:

```bash
if test -f archivo.txt; then
    echo "El archivo existe"
else
    echo "El archivo no existe"
fi
```

Uso de doble paréntesis para expresiones aritméticas:

```bash
if (( NUM1 > NUM2 )); then
    echo "NUM1 es mayor que NUM2"
fi
```

### Estructura `case`

```bash
case VARIABLE in
    patrón1)
        # Código para patrón1
        ;;
    patrón2)
        # Código para patrón2
        ;;
    *)
        # Código para cualquier otro caso
        ;;
esac
```

Ejemplo:

```bash
case $DIA in
    "Lunes")
        echo "Inicio de la semana"
        ;;
    "Viernes")
        echo "Fin de la semana"
        ;;
    *)
        echo "Día normal"
        ;;
esac
```

## Estructuras de repetición (bucles)

### Bucle `for`

```bash
for VAR in LISTA; do
    # Código a repetir
done
```

También se puede usar con un rango numérico:

```bash
for (( i=0; i<10; i++ )); do
    # Código a repetir
done
```

Ejemplo:

```bash
for NOMBRE in Rocío Ana Marcos María; do
    echo "Hola, $NOMBRE"
done
```

### Bucle `while`

Se ejecuta mientras la condición sea **verdadera**.

```bash
while [ CONDICIÓN ]; do
    # Código a repetir
done
```

Ejemplo:

```bash
COUNTER=1
while [ $COUNTER -le 5 ]; do
    echo "Contador: $COUNTER"
    ((COUNTER++))
done
```

#### `while`: bucle infinito

```bash
while :; do  # Siempre devuelve verdadero (0)
    # Código a repetir indefinidamente
    # a menos que se use 'break' para salir
done
```

```bash
while true; do
    # Código a repetir indefinidamente
done
```

```bash
while ((1)); do
    # Código a repetir indefinidamente
done
```

_**((1))** evalúa una expresión aritmética. En Bash, cualquier número distinto de cero se considera siempre verdadero._

#### `while`: bucle infinito con `break`

```bash
#!/bin/bash

contador 1

while
do
    echo "Contador: $contador"
    ((contador++))

    if [ $contador -gt 5 ]; then
        echo "Saliendo del bucle..."
        break  # Sale del bucle cuando el contador es mayor que 5
    fi
done
```

### Bucle `until`

Se ejecuta mientras la condición sea **falsa**.

```bash
until [ CONDICIÓN ]; do
    # Código a repetir
done
```

Ejemplo:

```bash
COUNTER=1
until [ $COUNTER -gt 5 ]; do
    echo "Contador: $COUNTER"
    ((COUNTER++))
done
```

### `break`, `continue` y `exit`

- `break`: Sale del bucle actual.
- `continue`: Salta a la siguiente iteración del bucle.
- `exit`: Termina la ejecución del script completo.

```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        break       # Sale del bucle cuando i es 5
    fi
    echo $i
done
```

```bash
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue    # Salta la iteración cuando i es 5
    fi
    echo $i
done
```

## Funciones

```bash
nombre_funcion() {
    # Código de la función
}
```

Si se escribe en línea:

```bash
nombre_funcion() { comando1; comando2; }
```

> Tener en cuenta los espacios después de la primera llave `{` y antes de la última `}`. <br>
> Entre comandos se utiliza `;` (incluso después del último comando).

### Comando `return`

Valor de retorno de una función (0-255):

```bash
# Script:
saludar() {
    echo "Hola, $1"
    return  # Devuelve 0 por defecto
}

# Uso:
saludar "Rocío"
echo "saluda ha devuelto: $?"  # Muestra el valor de retorno de la función (0)
```

En Linux una función **devuelve 0** si se ejecuta **correctamente** y un valor distinto de 0 si hay un error.

Ejemplo de función que verifica si un número es par o impar:

```bash
# Script:
es_par() {
    if (( $1 % 2 == 0 )); then
        return 0  # Verdadero
    else
        return 1  # Falso
    fi
}

# Uso:
es_par 4
if [ $? -eq 0 ]; then
    echo "El número es par"
else
    echo "El número es impar"
fi
```

### Guardar el valor de retorno en una variable

```bash
# Script:
sumar() {
    resultado=$(( $1 + $2 ))
    echo $resultado  # Imprime el resultado
}

# Uso:
valor=$(sumar 3 5)  # Captura la salida de la función
echo "La suma es: $valor"  # Muestra el valor almacenado
```

### Variables de ámbito global y local

```bash
# Script:
mi_variable="Soy global"  # Variable global
mi_funcion() {
    local mi_variable="Soy local"  # Variable local
    echo $mi_variable              # Muestra la variable local
}

# Uso:
mi_funcion
echo $mi_variable  # Muestra la variable global
```

## Arrays

```bash
# Forma de declarar arrays
mi_array=('valorA' 'valorB' 'valorC')
mi_array_2=(valor1 valor2 valor3)  # Sin comillas (salvo que haya espacios en el valor)
declare -a otro_array=("valorA" "valorB" "valorC")
su_array[0]="valorX"  # Asignando valores

# Acceso a elementos del array
echo ${mi_array[0]}  # valor1
echo ${mi_array[1]}  # valor2
echo ${mi_array[@]}  # Todos los elementos
echo ${mi_array[*]}  # Todos los elementos como una sola cadena

# Asignación de un valores a un índices específicos
mi_array[3]="valor4"
mi_array=([0]="valorA" [1]="valorB" [2]="valorC" [3]="valorD")

# Longitud del array
echo ${#mi_array[@]} # 4

# Recorrer el array
for elemento in "${mi_array[@]}"; do
    echo $elemento
done

# Recorrer el array por índices
for i in "${!mi_array[@]}"; do
    echo "Índice $i: ${mi_array[i]}"
done

# Eliminar un elemento del array
unset mi_array[1]

# Eliminar todo el array
unset mi_array
```

Ejemplos:

```bash
# Script:
declare -a frutas=('mango' 'mandarina' 'cereza')
echo "Primera fruta: ${frutas[0]}"
echo "Número de frutas: ${#frutas[@]}"

for fruta in "${frutas[@]}"; do
    echo "Fruta: $fruta"
done

# Salida:
Primera fruta: mango
Número de frutas: 3
Fruta: mango
Fruta: mandarina
Fruta: cereza
```
