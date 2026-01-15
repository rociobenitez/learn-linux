# Ejercicios de Gestión de Procesos en Linux

## Inspección y comprensión de procesos

**Muestra todos los procesos en ejecución en el sistema, incluyendo los que no pertenecen a tu usuario:**

```bash
ps aux
```

**Muestra los procesos ordenados por consumo de CPU (del que más consume al que menos):**

```bash
ps aux --sort -pcpu
```

**Muestra todos los procesos ordenados por consumo de memoria RAM:**

```bash
ps aux --sort -pmem
```

**Identifica el:**

- **PID**
- **Usuario**
- **Uso de CPU**
- **Uso de memoria**
- **Comando ejecutado**

**de un proceso concreto que tú elijas (por ejemplo, firefox, gnome-shell, etc.):**

```bash
ps aux | grep firefox
```

**Muestra solo los procesos del usuario actual sin mostrar los del sistema:**

```bash
ps -u
```

**Cuenta cuántos procesos tiene actualmente en ejecución tu usuario:**

```bash
ps -o pid,state -u <tu_usuario> | grep 'R' # Muestra el PID y estado de los procesos Running
```

```bash
ps -o pid,state -u <tu_usuario> | grep 'R' | wc -l # Cuenta los procesos en estado Running
```

**Indentifica el PID del proceso padre (PPID) de un proceso en ejecución:**

```bash
ps -o ppid -p 2747
```

**Visualiza la jerarquía de procesos en forma de árbol y localiza:**

- **systemd**
- **un proceso hijo suyo**

```bash
pstree | grep systemd
# pstree -p | grep systemd
```

## Monitorización en tiempo real

**Lanza una herramienta de monitorización en tiempo real y:**

- **Identifica el proceso que más CPU consume**
- **Identifica el proceso que más RAM consume**

```bash
top
# o htop
```

**Desde esa herramienta:**

- **Cambia el criterio de ordenación por CPU**
- **Luego por MEMORIA**

```bash
# En top, presiona 'M' para ordenar por memoria y 'P' para ordenar por CPU.
# En htop, usa las teclas de función F6 para cambiar el criterio de ordenación.
```

**Filtra los procesos para que solo se muestren los de tu usuario.**

```bash
top -u <tu_usuario>
```

**Identifica:**

- **tiempo de actividad del sistema**
- **número de usuarios conectados**
- **carga media (load average)**

```bash
uptime
```

## Estados de procesos

**Identifica procesos en los siguientes estados:**

- **Running**
- **Sleeping**
- **Stopped**
- **Zombie (si no hay, explica por qué)**


Explica (y demuestra con comandos) la diferencia entre:

- **un proceso detenido**
- **un proceso dormido**

⸻

Ejercicio 27

Detecta si existe algún proceso zombie en el sistema.

⸻

🧮 BLOQUE 6 – Consumo de recursos (CPU, memoria, carga)

Ejercicio 28

Muestra:

- **memoria total**
- **memoria usada**
- **memoria libre**
- **memoria en caché**

⸻

Ejercicio 29

Explica la diferencia entre:

- **memoria libre**
- **memoria disponible**

(apoyándote en la salida de un comando real)

⸻

Ejercicio 30

Muestra el consumo de memoria en formato legible para humanos.

⸻

Ejercicio 31

Muestra estadísticas de uso de CPU en intervalos de tiempo.

⸻

🧑‍🔧 BLOQUE 7 – Diagnóstico real (casos prácticos de sysadmin)

Ejercicio 32

Un usuario se queja de que el sistema va lento.
Identifica qué proceso es el responsable y justifica tu respuesta.

⸻

Ejercicio 33

Un proceso consume CPU de forma anómala:

- **identifícalo**
- **reduce su impacto**
- **termínalo si es necesario**

⸻

Ejercicio 34

Detecta si un proceso se está ejecutando desde hace demasiado tiempo.

⸻

Ejercicio 35

Obtén el tiempo de ejecución total de un proceso concreto.

⸻

🧪 BLOQUE 8 – Integración con scripting (nivel top)

Ejercicio 36

Crea un one-liner que muestre:

- **PID**
- **usuario**
- **%CPU**
- **%MEM**
  de los 5 procesos que más CPU consumen.

⸻

Ejercicio 37

Redirige esa información a un fichero de log.

⸻

Ejercicio 38

Programa un comando que:

- **detecte procesos con más de X% de CPU**
- **muestre una alerta por pantalla**

(no script completo, solo comando encadenado)
