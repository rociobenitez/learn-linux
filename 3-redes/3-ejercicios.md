# Ejercicios de Gestión de Redes en Linux

### Encuentra tu IP real (filtrada), no la de localhost

```bash
ip addr show | grep 'inet ' | grep -v '127.0.0.1'
ifconfig | grep 'inet ' | grep -v '127.0.0.1'
```

Uso real: necesitas dar tu IP a un compañero de equipo para que pueda conectarse a tu máquina.

_`127.0.0.1` es la IP de localhost, que no sirve para conexiones externas._

_`-v` en `grep` significa "invertir", es decir, excluir las líneas que coinciden._

`192.168.x.x` o `10.x.x.x` son IPs privadas típicas en redes locales.

### Identifica tu "Puerta de Enlace" (Gateway) predeterminada

```bash
ip route show default
route -n | grep 'UG'
```

Uso real: necesitas saber la **IP de tu router** para acceder a su configuración.

Si no tienes internet, el primer paso es hacer ping a esta IP. Si responde, el problema es más allá de tu red local (tu proveedor de internet, DNS, etc.). Si no responde, el problema está en tu red local (WiFi/Router/configuración).

### Diagnóstico de conectividad: Envía paquetes ICMP a una IP o dominio

```bash
ping -c 5 1.1.1.1
```

Uso real: quieres comprobar si tienes conectividad a internet enviando 5 paquetes ICMP a la IP pública de Cloudflare (1.1.1.1).

Al final verás `packet loss` (pérdida de paquetes). Si es 0%, tu conexión es buena. Si es mayor, tienes problemas de conectividad.

### Haz ping a tu propia máquina (localhost)

```bash
ping -c 2 localhost
```

`ping` traduce `localhost` a `127.0.0.1`.

`127.0.0.1` es la IP de loopback (bucle invertido), usada para pruebas internas en tu propia máquina.

### Rastrear la ruta que siguen los paquetes hasta un destino (por ejemplo, www.google.com)

```bash
traceroute www.google.com
```

Cada línea numerada es un router (salto por el que pasas):

- Línea 1: tu router
- Líneas siguientes: la red de tu proveedor (ISP)
- Última línea: el destino final (www.google.com)

Si la conexión se corta en el salto 3, sabes que es culpa de tu proveedor de internet, no del servidor de destino.

### Inspecciona tu configuración de DNS

```bash
cat /etc/resolv.conf
```

El archivo `/etc/hosts` tiene prioridad sobre DNS. Si escribes ahí una IP para un dominio, el sistema usará esa IP en lugar de consultar al servidor DNS.

```bash
cat /etc/hosts
```

### Inspecciona los puertos abiertos y servicios en escucha en tu máquina

```bash
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tuln
```

_`lsof` (List Open Files) lista los ficheros abiertos. En Linux, todo es un fichero, incluyendo conexiones de red._

- `-i` filtra por conexiones de red
- `-P` muestra los números de puerto en lugar de los nombres
- `-n` evita la resolución de nombres (más rápido)
- `grep LISTEN` filtra solo los puertos en estado de escucha

_`netstat` (network statistics) muestra conexiones de red, tablas de enrutamiento, estadísticas de interfaz, etc._

Si lanzas un servidor local y te dice "Address already in use", usa estos comandos para ver qué proceso está usando ese puerto.


```bash
sudo lsof -i -P -n | grep LISTEN | grep -E "8000|5173"

# Ejemplo de salida:
node     12345 username   20u  IPv4 0x48ddf32872861f9d      0t0  TCP 127.0.0.1:5173 (LISTEN)
php84    67890 username   11u  IPv4 0x675bd5e167750d0d      0t0  TCP 127.0.0.1:8000 (LISTEN)
```

_Usamos `grep -E` para buscar múltiples puertos a la vez (8000 y 5173 en este caso)._

Columnas:
- `COMMAND`: nombre del proceso (node, php84, etc.)
- `PID`: ID del proceso (12345, 67890, etc.)
- `USER`: usuario que ejecuta el proceso
- `FD`: descriptor de fichero
- `TYPE`: tipo de conexión (IPv4, IPv6)
- `DEVICE`: identificador del dispositivo
- `SIZE/OFF`: tamaño o desplazamiento
- `NODE`: nodo del sistema de archivos
- `NAME`: dirección y puerto en escucha