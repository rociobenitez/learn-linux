# Gestión de procesos

## Introducción a los procesos

**Programa**: conjunto de instrucciones almacenadas en un archivo que realiza una tarea específica cuando se ejecuta.

**Proceso**: instancia en ejecución de un programa.

Todos los procesos necesitan **recursos** del sistema como CPU, memoria, archivos y dispositivos de entrada/salida.

Los **recursos son asignados a un proceso** por el sistema operativo cuando se crea y mientras se está ejecutando, y son liberados cuando el proceso termina.

Para que un programa se ejecute, el sistema operativo crea un proceso y le asigna los recursos necesarios.

El proceso puede crear **procesos hijos** para realizar tareas específicas.

**El Sistema Operativo:**

- Asigna recursos a los procesos.
  - Tiempo de CPU
  - Memoria
  - Acceso a archivos y dispositivos
  - Dispositivos de entrada/salida
- Se encarga de:
  - Crear y eliminar procesos
  - Planificar procesos
  - Gestionar la sincronización y comunicación entre procesos
  - Manejar la sincronización entre procesos
  - Manejar bloques mutuos

Cada vez que un programa se convierte en un proceso, se le asigna un **PID** único y se le asocia una **estructura de datos** que contiene información sobre el proceso. Esta estructura de datos se llama **Bloque de control del proceso (PCB)**.

**Bloque de control del proceso o PCB (Process Control Block)**: estructura de datos que contiene información sobre un proceso, incluyendo su PID, estado, contador de programa, registros de CPU, información de memoria y otros detalles necesarios para la gestión del proceso.

**Hilo (Thread)**: unidad básica de ejecución dentro de un proceso.

- Un proceso puede tener múltiples hilos que **comparten los mismos recursos del proceso**.
- Un proceso tendrá siempre al menos un hilo principal.
- Es un subproceso dentro de un proceso.

**Diferencias entre proceso e hilo**:

| Aspecto            | Proceso                                                 | Hilo                                                      |
| ------------------ | ------------------------------------------------------- | --------------------------------------------------------- |
| **Independencia**  | **Independiente**, con su **propio** espacio de memoria | Depende del proceso padre, **comparte** recursos          |
| **Recursos**       | Consume más recursos al crearse                         | Más ligero, eficiente y rápido de crear                   |
| **Comportamiento** | Aislado de otros procesos                               | Colabora con otros hilos del mismo proceso                |
| **Fallos**         | Si un proceso falla, **no** afecta a otros procesos     | Si un hilo falla, puede **afectar** a todo el proceso     |
| **Comunicación**   | Comunicación entre procesos es más **compleja**         | Comunicación entre hilos es más **sencilla** y **rápida** |
| **Contexto**       | Cambio de contexto más costoso                          | Cambio de contexto más rápido                             |

**Diferencia entre multitarea y multihilo**:

- **Multitarea**: capacidad del sistema operativo para ejecutar múltiples procesos simultáneamente.
  - Cada proceso tiene su propio espacio de memoria y recursos.
  - Asigna memoria y recursos a cada proceso de forma independiente.
- **Multihilo**: capacidad de un proceso para ejecutar múltiples hilos dentro del mismo proceso.
  - Los hilos comparten el mismo espacio de memoria y recursos del proceso.
  - Permite una comunicación más rápida y eficiente entre hilos.

### Ejemplos

| Programa                                                         | Proceso                                                                                                                     | Hilos                                                            |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| Navegador web - Chrome.exe es un programa almacenado en disco    | Cada ventana de Chrome es un proceso. Cada proceso es independiente y si uno falla, las otras pestañas no se ven afectadas. | Hilos para renderizar la página, procesar JavaScript, etc.       |
| Editor de texto - Notepad.exe es un programa almacenado en disco | Al ejecutarlo, se crea un proceso.                                                                                          | Hilos para manejar la interfaz, guardar archivos, etc.           |
| El comando `gcc` es un programa compilador de C                  | Al compilar un archivo, se crea un proceso que realiza la compilación.                                                      | Hilos para analizar el código, optimizar, generar código máquina |
| El comando `vim` es un programa editor de texto                  | Al abrir un archivo con `vim`, se crea un proceso que maneja la edición del archivo.                                        | Hilos para manejar la interfaz, guardar cambios, etc.            |

## Estados de un proceso

| **Estado del proceso**                     |
| ------------------------------------------ |
| `R`: Ejecutando o listo para ejecutarse    |
| `S`: Suspendido (sleeping)                 |
| `D`: Esperando I/O (uninterruptible sleep) |
| `Z`: Proceso zombi                         |
| `T`: Detenido (stopped)                    |

## Comandos para la gestión de procesos

| Comando               | Descripción                                                                       |
| --------------------- | --------------------------------------------------------------------------------- |
| [`ps`](#ps)           | Muestra información sobre procesos en ejecución                                   |
| [`pstree`](#pstree)   | Muestra la jerarquía de procesos en forma de árbol                                |
| [`uptime`](#uptime)   | Muestra el tiempo de actividad del sistema y la carga media                       |
| [`top`](#top)         | Muestra procesos en ejecución en tiempo real                                      |
| [`htop`](#htop)       | Versión mejorada de `top` con interfaz interactiva                                |
| [`kill`](#kill)       | Envía señales a los procesos para terminarlos o controlarlos                      |
| [`killall`](#killall) | Envía señales a todos los procesos con un nombre específico                       |
| [`vmstat`](#vmstat)   | Muestra estadísticas del sistema relacionadas con la memoria, procesos, CPU y más |

### `ps` _(process status)_

Muestra información sobre los procesos en ejecución.

```bash
ps  # Muestra los procesos en la terminal actual

PID TTY          TIME CMD
1234 pts/0    00:00:01 bash
5678 pts/0    00:00:00 ps
```

| **Columna** | **Descripción**                        |
| ----------- | -------------------------------------- |
| **PID**     | Identificador del proceso              |
| **TTY**     | Terminal asociado al proceso           |
| **TIME**    | Tiempo de CPU utilizado por el proceso |
| **CMD**     | Comando que inició el proceso          |

| Opciones comunes de `ps`                      | Descripción                                                     |
| --------------------------------------------- | --------------------------------------------------------------- |
| `ps -l`                                       | Muestra una lista larga con más detalles                        |
| `ps -f`                                       | Muestra una lista completa con detalles adicionales             |
| `ps -l`                                       | Muestra una lista larga con más detalles                        |
| `ps -a`                                       | Muestra procesos de todos los usuarios en la terminal actual    |
| `ps -u nombre_usuario`                        | Muestra procesos del usuario especificado                       |
| `ps -U nombre_usuario`                        | Muestra procesos del usuario especificado y sus hijos           |
| `ps -C nombre_proceso`                        | Muestra procesos por nombre de comando                          |
| `ps -x`                                       | Muestra procesos sin terminal asociado                          |
| `ps -p PID`                                   | Muestra información del proceso con el PID especificado         |
| `ps -o pid,ppid,cmd,%mem,%cpu`                | Muestra columnas específicas                                    |
| `ps -eo pid,ppid,cmd,%mem,%cpu`               | Muestra columnas específicas                                    |
| `ps -eo pid,ppid,cmd,%mem,%cpu --sort==-%mem` | Muestra columnas específicas ordenadas por uso de memoria       |
| `ps -ef`                                      | Muestra todos los procesos en formato completo                  |
| `ps -ef \| less`                              | Muestra todos los procesos con paginación                       |
| `ps aux`                                      | Muestra todos los procesos con detalles adicionales             |
| `ps aux --sort -pcpu`                         | Ordena los procesos por uso de CPU                              |
| `ps aux --sort -pmem`                         | Ordena los procesos por uso de memoria                          |
| `ps aux --sort -pcpu,+pmem`                   | Ordena los procesos por uso de CPU y memoria                    |
| `ps aux \| grep nombre_usuario`               | Filtra procesos por nombre de usuario                           |
| `ps aux \| grep ' R '`                        | Muestra procesos en estado 'Ejecutando o listo para ejecutarse' |
| `ps aux \| grep ' S '`                        | Muestra procesos en estado 'Suspendido (sleeping)'              |

#### `ps aux`

```bash
ps aux  # Muestra todos los procesos con detalles adicionales

USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1 225280  8320 ?        Ss   10:00   0:01 /sbin/init
user      1234  0.1  0.5 105000 20000 pts/0    Ss   10:05   0:00 /bin/bash
...
```

| **Columna**                 | **Descripción**                                                                             |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| **USER**                    | Nombre del usuario que ejecuta el proceso                                                   |
| **PID (Process ID)**        | Identificador único asignado a cada proceso                                                 |
| **%CPU**                    | Porcentaje de uso de CPU del proceso                                                        |
| **%MEM**                    | Porcentaje de uso de memoria del proceso                                                    |
| **VSZ (Virtual Size)**      | Tamaño virtual del proceso en KB                                                            |
| **RSS (Resident Set Size)** | Tamaño de memoria física utilizada por el proceso en KB                                     |
| **TTY (Terminal Type)**     | Terminal asociado al proceso                                                                |
| **STAT (Process State)**    | Estado actual del proceso                                                                   |
|                             | `I`: Inactivo (idle)                                                                        |
|                             | `R`: Ejecutando o listo para ejecutarse                                                     |
|                             | `S`: Suspendido (sleeping) - Pausa interrumpible (espera que se complete un evento)         |
|                             | `U`: Esperando I/O (uninterruptible sleep)                                                  |
|                             | `Z`: Proceso zombie (terminado pero su proceso padre sigue vivo y no ha recogido su estado) |
|                             | `T`: Detenido (stopped)                                                                     |
|                             | `+`: Proceso en primer plano (foreground)                                                   |
|                             | `s`: Proceso que es un líder de sesión                                                      |
|                             | `<`: Proceso de alta prioridad                                                              |
|                             | `N`: Proceso con baja prioridad                                                             |
| **START (Start Time)**      | Hora en que el proceso comenzó a ejecutarse                                                 |
| **TIME (CPU Time)**         | Tiempo total de CPU utilizado por el proceso                                                |
| **COMMAND**                 | Comando que inició el proceso                                                               |

**Filtrado de procesos por uso de CPU o memoria:**

```bash
ps aux --sort -pcpu                     # Ordena los procesos por uso de CPU
ps aux --sort -pmem                     # Ordena los procesos por uso de memoria
ps aux --sort=-%cpu | head -n 10        # 10 procesos con mayor uso de CPU
ps aux --sort=-%mem | head -n 10        # 10 procesos con mayor uso de memoria
ps aux --sort -pcpu,+pmem | head -n 10  # 10 procesos con mayor uso de CPU y memoria

```

**Filtrado de procesos por usuario:**

```bash
ps aux | grep nombre_usuario  # Filtra procesos por nombre de usuario
```

o también:

```bash
ps -u nombre_usuario  # Muestra procesos del usuario especificado
```

**\*Filtrado de procesos por estado:**

```bash
ps aux | grep ' R '  # Muestra procesos en estado 'Ejecutando o listo para ejecutarse'
ps aux | grep ' S '  # Muestra procesos en estado 'Suspendido (sleeping)'
```

**\*Filtrado de procesos por PID:**

```bash
ps -p PID  # Muestra información del proceso con el PID especificado
```

#### `ps -ef`

```bash
ps -ef  # Muestra todos los procesos en formato completo

UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 10:00 ?        00:01:00 /sbin/init
user      1234  1200  0 10:05 pts/0    00:00:00 /bin/bash
...
user      6848  1978  0 10:10 pts/0    00:00:00 ps -ef  # proceso lanzado con el comando actual
```

| **Columna**                  | **Descripción**                                            |
| ---------------------------- | ---------------------------------------------------------- |
| **UID (User ID)**            | identificador del usuario que ejecuta el proceso           |
| **PID (Process ID)**         | identificador único asignado a cada proceso                |
| **PPID (Parent Process ID)** | identificador del proceso padre que creó el proceso actual |
| **C (CPU Utilization)**      | porcentaje de uso de CPU del proceso                       |
| **STIME (Start Time)**       | hora en que el proceso comenzó a ejecutarse                |
| **TTY (Terminal Type)**      | terminal asociado al proceso                               |
| **TIME (CPU Time)**          | tiempo total de CPU utilizado por el proceso               |
| **CMD (Command)**            | comando que inició el proceso                              |

```bash
ps -ef | less  # Muestra todos los procesos con paginación
ps -ef | grep nombre_proceso  # Filtra procesos por nombre
```

#### `ps -C`

Presenta los procesos que están ejecutándose con un nombre de comando específico.

```bash
ps -C nombre_proceso  # Muestra procesos por nombre de comando
```

Ejemplo:

```bash
ps -C systemd

PID TTY          TIME CMD
    1 ?        00:01:00 systemd
500 ?        00:00:05 systemd-journald
```

#### `ps -o`

```bash
ps -o pid,ppid,cmd,%mem,%cpu  # Muestra columnas específicas
```

### `pstree`

Muestra los procesos en una estructura de árbol, mostrando las relaciones entre procesos padres e hijos.

```bash
pstree         # Muestra la jerarquía de procesos en forma de árbol
pstree 1597    # Muestra la jerarquía de procesos para el PID 1597
pstree -p      # Jerarquía de procesos con PIDs
pstree | more  # Jerarquía de procesos con paginación
pstree | less  # Similar a more, pero con más funcionalidades
```

Ejemplo de salida:

```bash
systemd(1)─┬─ModemManager---2*[{ModemManager}]
           ├─NetworkManager───2*[{NetworkManager}]
           ├─colord───2*[{colord}]
           ├─gdm3─+─gdm-session-wor─+─dgm-wayland-ses-+-gnome-session-b---2*[{gnome-session-b}]
           │         │                 │                  ├─3*[{gdm-wayland-ses-}]
           │         │                 └─2*[{gdm-session-wor}]
           │         └─2*[{gdm3}]
           └─cron
```

- `systemd` es el proceso padre con PID 1.
- **Ramas idénticas**: `pstree` combina ramas idénticas poniéndolas entre corchetes y prefijándolas con un asterisco y el número de instancias (por ejemplo, `2*[{ModemManager}]` indica que hay dos instancias del proceso `ModemManager`).

### `top`

Muestra una vista dinámica **en tiempo real** de los procesos en ejecución.

```bash
top

top - 10:15:30 up  1:23,  2 users,  load average: 0.15, 0.10, 0.05
Tasks: 150 total,   1 running, 149 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.0 us,  1.0 sy,  0.0 ni, 96.0 id,  0.5 wa,  0.0 hi,  0.5 si,  0.0 st
MiB Mem :   8000.0 total,   2000.0 free,   3000.0 used,   3000.0 buff/cache
MiB Swap:   2000.0 total,   1500.0 free,    500.0 used.   4000.0 avail Mem

PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
1234 user      20   0  105000  20000   5000 S   5.0  0.2   0:10.00 bash
5678 root      20   0  225280   8320   4000 S   2.0  0.1   0:05.00 init
...
```

| **Campo**         | **Descripción**                                                                                           |
| ----------------- | --------------------------------------------------------------------------------------------------------- |
| **top**           | Información general del sistema: hora actual, tiempo de actividad, usuarios conectados, carga del sistema |
| **Tasks**         | Número total de tareas/procesos y su estado (ejecutando, durmiendo, detenido, zombi)                      |
| **%Cpu(s)**       | Uso de CPU dividido en diferentes categorías (usuario, sistema, inactivo, espera, etc.)                   |
| **MiB Mem**       | Información sobre el uso de memoria física (total, libre, usada, en caché)                                |
| **MiB Swap**      | Información sobre el uso de memoria swap (total, libre, usada)                                            |
| **PID**           | Identificador del proceso                                                                                 |
| **USER**          | Usuario que ejecuta el proceso                                                                            |
| **PR (Priority)** | Prioridad del proceso                                                                                     |
| **NI (Nice)**     | Valor de "nice" del proceso (afecta la prioridad)                                                         |
| **VIRT**          | Memoria virtual total utilizada por el proceso (incluye memoria paginada y compartida)                    |
| **RES**           | Memoria residente (física) utilizada por el proceso                                                       |
| **SHR**           | Memoria compartida utilizada por el proceso                                                               |
| **S (State)**     | Estado actual del proceso                                                                                 |
| **%CPU**          | Porcentaje de uso de CPU del proceso                                                                      |
| **%MEM**          | Porcentaje de uso de memoria del proceso                                                                  |
| **TIME+**         | Tiempo total de CPU utilizado por el proceso                                                              |
| **COMMAND**       | Comando que inició el proceso                                                                             |

> **MiB Mem**: memoria física del sistema, dividida en total, libre, usada y en caché.<br> > **MiB Swap**: espacio en el disco duro utilizado como memoria virtual (memoria de intercambio) cuando la memoria RAM está llena.

```bash
top -o %CPU            # Ordena los procesos por uso de CPU
top -o %MEM            # Ordena los procesos por uso de memoria
top -u nombre_usuario  # Muestra procesos del usuario especificado
```

### `htop`

Interfaz interactiva para monitorear procesos en tiempo real, similar a `top`, pero con una interfaz más amigable y opciones adicionales.

```bash
htop
```

Se puede instalar con:

```bash
sudo apt install htop    # En distribuciones basadas en Debian/Ubuntu
sudo dnf install htop -y # En distribuciones basadas en Fedora
```

| **F1-F10** | **Descripción**                             |
| ---------- | ------------------------------------------- |
| **F1**     | Ayuda                                       |
| **F2**     | Configuración                               |
| **F3**     | Buscar proceso                              |
| **F4**     | Filtrar procesos                            |
| **F5**     | Vista de árbol de procesos                  |
| **F6**     | Ordenar por columna                         |
| **F7**     | Aumentar prioridad (disminuir valor "nice") |
| **F8**     | Disminuir prioridad (aumentar valor "nice") |
| **F9**     | Matar proceso                               |
| **F10**    | Salir                                       |

### `kill`

Envía señales a los procesos para terminarlos o controlarlos.

Sintaxis:

```bash
kill [-s señal] PID
```

```bash
kill PID  # Envía la señal SIGTERM (15) para terminar el proceso de forma segura
kill -9 PID  # Envía la señal SIGKILL (9) para forzar la terminación del proceso
```

| **Señal** | **Descripción**                                                               |
| --------- | ----------------------------------------------------------------------------- |
| `SIGTERM` | Señal de terminación (15) para finalizar el proceso de forma segura           |
| `SIGKILL` | Señal de terminación **forzada** (9) para finalizar el proceso inmediatamente |
| `SIGSTOP` | Señal para detener (pausar) el proceso                                        |
| `SIGCONT` | Señal para continuar (reanudar) un proceso detenido                           |

Ejemplos:

```bash
kill 1234        # Termina el proceso con PID 1234 de forma segura
kill -9 firefox  # Fuerza la terminación del proceso 'firefox' (la aplicación debe estar en ejecución)
kill -9 1613 2216 3450  # Fuerza la terminación de múltiples procesos por PID
```

> Debes tener privilegios de superusuario para matar procesos que no pertenecen a tu usuario.

```bash
kill -l  # Lista todas las señales disponibles

1) SIGHUP          2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
6) SIGABRT         7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV       12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT     17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN       22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM     27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS        34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4    39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9    44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14   49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11   54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6    59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1    64) SIGRTMAX
```

### `killall`

Envía señales a todos los procesos que coinciden con un nombre de comando específico.

Sintaxis:

```bash
killall [-u usuario] [-s señal] nombre_proceso
```

```bash
killall nombre_proceso  # Envía la señal SIGTERM (15) a todos los procesos con el nombre especificado
killall -9 nombre_proceso  # Envía la señal SIGKILL (9) para forzar la terminación de todos los procesos con el nombre especificado
```

### `vmstat`

Muestra estadísticas del sistema relacionadas con la memoria, procesos, CPU y más.

```bash
vmstat 2 5  # Muestra estadísticas cada 2 segundos, 5 veces
```
