# Gestión de memoria en Linux

## Memoria física y memoria virtual

| **Memoria física**    | **Memoria virtual**                                                     |
| --------------------- | ----------------------------------------------------------------------- |
| Memoria RAM           | Espacio de direcciones que un proceso puede utilizar                    |
| Rápida y volátil      | Más lenta, utiliza disco duro para almacenamiento                       |
| Limitada por hardware | Más amplia, permite ejecutar procesos más grandes que la RAM disponible |
| Acceso directo        | Requiere traducción de direcciones                                      |

## Swap o intercambio

- **Zona de intercambio**: espacio en disco utilizado como memoria virtual adicional cuando la RAM está llena.
- **Administrador de memoria**: gestiona el uso de la memoria física y virtual, moviendo datos entre RAM y swap según sea necesario.

> La **gestión de memoria** es especialmente relevante en sistemas operativos **multiproceso**, y más aún en sistemas **multihilo**, donde varios procesos o hilos pueden competir por los recursos de memoria disponibles.

## Comandos para gestionar la memoria

| Comando  | Descripción                                                   |
| -------- | ------------------------------------------------------------- |
| `free`   | Muestra el uso de memoria (RAM y swap)                        |
| `vmstat` | Proporciona estadísticas detalladas de memoria                |
| `top`    | Muestra procesos en ejecución y su uso de memoria             |
| `htop`   | Versión mejorada de `top` con interfaz interactiva            |
| `ps`     | Muestra información sobre procesos y su uso de memoria        |
| `smem`   | Proporciona informes detallados de uso de memoria por proceso |

### `free`

Determina la _cantidad de memoria y espacio de intercambio disponible_ en el sistema.

```bash
free

                total        used        free      shared  buff/cache   available
Mem:           7.8G        2.1G        3.2G        150M        2.5G        5.2G
Swap:          2.0G          0B        2.0G
```

| Columna      | Descripción                                           |
| ------------ | ----------------------------------------------------- |
| `total`      | Memoria total disponible                              |
| `used`       | Memoria actualmente en uso                            |
| `free`       | Memoria libre (que no está siendo utilizada)          |
| `shared`     | Memoria compartida entre procesos                     |
| `buff/cache` | Memoria utilizada para buffers y caché                |
| `available`  | Memoria disponible para nuevos procesos sin usar swap |

| Buffer                                                              | Caché                                                               |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Memoria utilizada por el kernel para almacenar **datos temporales** | Memoria utilizada para almacenar datos **frecuentemente accedidos** |
| Se accede solo una vez                                              | Puede accederse múltiples veces                                     |

> La información de `free` procede del archivo `/proc/meminfo`.

```bash
cat /proc/meminfo

MemTotal:        8192000 kB
MemFree:         3276800 kB
MemAvailable:    5242880 kB
Buffers:         256000 kB
Cached:          2048000 kB
SwapTotal:       2097152 kB
SwapFree:        2097152 kB
```

```bash
cat /proc/meminfo | grep MemTotal

MemTotal:        8192000 kB
```

Por defecto, `free` muestra la información en **kibibytes** (KiB). Utiliza la opción `-h` para un formato legible (MB, GB).

- byte se denota con B
- bit se denota con b
- 1 KB = 1,000 bytes ($10^{3}$)
- 1 KiB = 1,024 bytes ($2^{10}$)

```bash
free --kilo+ # uso de memoria en kilobytes (1 KB = 1,000 bytes)
free --mega+ # uso de memoria en megabytes (1 MB = 1,000,000 bytes)
free --giga+ # uso de memoria en gigabytes (1 GB = 1,000,000,000 bytes)
```

```bash
free -b  # uso de memoria en bytes
free -k  # uso de memoria en kibibytes
free -m  # uso de memoria en mebi-bytes
free -g  # uso de memoria en gibibytes
```

```bash
free -h # Muestra el uso de memoria en formato legible (human-readable)
```

```bash
free -s 5 # Actualiza el uso de memoria cada 5 segundos
```

Para terminar la actualización automática, presiona `Ctrl + C`.

### `swapon` y `swapoff`

Determina exactamente que archivos y particiones se utilizan como espacio de intercambio (swap).

También se utiliza para activar o desactivar el uso de swap.

```bash
swapon -s

Filename                                Type        Size    Used    Priority
/swapfile                               file        2097152 0       -2
/dev/sda2                               partition   2097152 0       -2
```

### `vmstat`

Proporciona estadísticas detalladas sobre el uso de memoria, incluyendo memoria física y swap.

```bash
vmstat -s

       8192000 K total memory
       2147483 K used memory
       3276800 K free memory
       256000 K buffer memory
      2048000 K cached memory
       2097152 K total swap
             0 K used swap
       2097152 K free swap
```
