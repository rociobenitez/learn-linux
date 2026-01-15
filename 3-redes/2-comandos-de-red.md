# Comandos de red

## `hostname`

Muestra el nombre del host del sistema o establece un nuevo nombre de host.

```bash
hostname    # Muestra el nombre del host actual
hostname -i # Muestra la dirección IP del host
```

## `ping`

Envía paquetes de solicitud de eco ICMP a un host de red para probar la conectividad y medir el tiempo de respuesta.

```bash
ping www.ejemplo.com
ping -c 3 www.ejemplo.com  # Envía 3 paquetes y luego se detiene
```

**Ejemplo de salida:**

```plaintext
PING ejemplo.com (192.0.2.1) 56(84) bytes of data.
64 bytes from ejemplo.com: icmp_seq=1 ttl=64 time=0.123 ms
64 bytes from ejemplo.com: icmp_seq=2 ttl=64 time=0.456 ms
64 bytes from ejemplo.com: icmp_seq=3 ttl=64 time=0.789 ms

--- ejemplo.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss
rtt min/avg/max/mdev = 0.123/0.456/0.789 ms
```

> `ping` verifica la **conectividad** entre tu equipo y un destino (otra IP o nombre de dominio) enviando paquetes ICMP y midiendo el tiempo que tardan en recibir una respuesta.

## `curl`

Transfiere datos desde o hacia un servidor utilizando varios protocolos, como HTTP, HTTPS, FTP, etc.

```bash
curl http://ejemplo.com  # Muestra el contenido de la página web
```

**Ejemplo de salida:**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Ejemplo de Página</title>
  </head>
  <body>
    <h1>¡Hola, Mundo!</h1>
    <p>Esta es una página de ejemplo servida por curl.</p>
  </body>
</html>
```

Para descargar un archivo y guardarlo con su nombre original:

```bash
curl -O http://ejemplo.com/archivo.html
```

## `wget`

Descarga archivos desde la web.

```bash
wget http://ejemplo.com/archivo.zip
```

## `ifconfig`

Muestra o configura las interfaces de red en sistemas basados en Unix/Linux.

```bash
ifconfig
```

## `netstat`

Muestra estadísticas de red, conexiones activas y tablas de enrutamiento.

```bash
netstat -tuln
```

## `traceroute`

Muestra la ruta que toman los paquetes para llegar a un host de red.

```bash
traceroute ejemplo.com
```

Permite determinar la ruta tomada por un paquete para alcanzar su destino, ya sea en Internet o en la red local.

Permite detectar posibles problemas en la conexión, de forma que, al indicar el destino, este comando nos indicará en qué punto hacia el destino se queda nuestra conexión.

Por defecto, no estará disponible en la distribución Ubuntu. Procederemos a su instalación como siempre:

```bash
sudo apt update
sudo apt install traceroute
```

Una vez que se ha instalado, volvemos a lanzar el comando para verificar si hay conectividad, por ejemplo, con los servidores de elmundo.es:

```bash
traceroute elmundo.es
```

**_Salida de ejemplo:_**

```plaintext
traceroute to elmundo.es (151.101.133.50), 30 hops max, 60 byte packets
 1  _gateway (10.0.2.2) 1.123 ms  1.045 ms  0.987 ms
 2  192.168.1.1 (192.168.1.1) 10.456 ms  10.345 ms  10.234 ms
 3  * * *
 4 141.red-81-46-64.customer.static.ccgg.telefonica.net (81.46.64.141) 7.123 ms  7.045 ms  7.987 ms
 5  80.red-81-46-64.customer.static.ccgg.telefonica.net (80.46.64.80) 8.123 ms  8.045 ms  8.987 ms
 ...
```

Cuando en la ejecución del comando se muestran asteriscos (`*`) es porque **no se obtiene respuesta del router en ese salto.**

El **número de ping** (peticiones ICMP) que hace traceroute **para cada salto es de 3**, aunque esto es por defecto y se puede cambiar.

La información que se muestra:

- La primera columna corresponde al recuento de saltos.
- La segunda columna representa la dirección IP de ese salto.
- Siguientes columnas muestran tres tiempos separados por espacios en milisegundos que corresponden al tiempo al tiempo en llegar a ese router del salto en cada uno de los pings realizados.

> El comando traceroute tiene diferentes opciones que podemos consultar como siempre con `man`. Se puede utilizar varias opciones unidas en un mismo comando.

### Opciones útiles de `traceroute`

La opción `-q` permite especificar el número de pings que se realizan por salto:

```bash
traceroute -q 5 www.elmundo.es  # Realiza 5 pings por salto
```

La opción `-I` utiliza paquetes ICMP en lugar de UDP (por defecto):

```bash
traceroute -I -q 4 www.elmundo.es # Realiza 4 pings ICMP por salto
```

La opción `-m` permite especificar el número máximo de saltos (TTL):

```bash
traceroute -m 20 www.elmundo.es  # Máximo 20 saltos
```

La opción `-n` muestra las direcciones IP en lugar de resolver los nombres de dominio:

```bash
traceroute -n www.elmundo.es  # Muestra solo direcciones IP
```

La opción `-g` _(gate)_ permite enrutar el paquete a través de un Gateway específico en caso que tengamos varios (grandes empresas).

Permite seguir teniendo comunicaciones con equipos o servidores en caso de que un enrutamiento por el motivo que sea está inactivo o inoperativo.

```bash
traceroute -g <gateway_ip> www.elmundo.es  # Utiliza un gateway específico
```

La opción `-p` permite especificar el puerto de destino (por defecto 33434):

```bash
traceroute -p 80 elmundo.es  # Utiliza el puerto 80
```

## route

Muestra y manipula la tabla de enrutamiento IP del kernel.

```bash
route     # Muestra la tabla de enrutamiento
```

```bash
route -n  # Muestra la tabla de enrutamiento sin resolver nombres
```

***Salida de ejemplo:***

```plaintext
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.2.2        0.0.0.0         UG    100    0        0 enp0s3
10.0.2.0        0.0.0.0         255.255.255.0   U     100    0        0 enp0s3
```




En la distribución de Ubuntu, no suele estar disponible por defecto y se encuentra en el paquete “net-tools” como se indica la ejecutar el comando.

```bash
sudo apt update
sudo apt install net-tools
```

## Mostrar la configuración de la interfaz de red

```bash
sudo apt update
sudo apt install iproute2
```

### `ip addr` o `ip a`

Muestra o configura las direcciones IP y las interfaces de red.

```bash
ip a               # Configuración de todas las interfaces de red
ip addr show       # Configuración de un dispositivo específico
ip addr show eth0  # Configuración de la interfaz eth0
```

`eth0` suele ser la interfaz red principal que conecta tu servidor a la red.

**_Salida de ejemplo:_**

```plaintext
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:1a:2b:3c:4d:5e brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.100/24 brd 192.168.1.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::21a:2bff:fe3c:4d5e/64 scope link
       valid_lft forever preferred_lft forever
```

Puedes ver la dirección IP de tu servidor en la línea 2 después de la palabra `inet`.

### `ip -s l`

Muestra estadísticas de transmisión y recepción de la inferfaz IP.

```bash
ip -s l
```
