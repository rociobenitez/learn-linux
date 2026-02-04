# Redes de Ordenadores - Cheatsheet

|                                       | Definición                                                                                              |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Red de Ordenadores**                | Conjunto de dispositivos interconectados que pueden comunicarse entre sí.                               |
| **Interfaz de Red**                   | Punto de conexión entre un dispositivo y una red.                                                       |
| **Internet**                          | La red de ordenadores con más nodos en el mundo, basada en un conjunto de protocolos del modelo TCP/IP. |
| **LAN (Local Area Network)**          | Red que conecta dispositivos en un área geográfica limitada, como una oficina o una casa.               |
| **WLAN (Wireless LAN)**               | Red de área local que utiliza tecnología inalámbrica para la comunicación.                              |
| **WIFI (Wireless Fidelity)**          | Tecnología de red inalámbrica que permite la conexión a Internet y a redes locales.                     |
| **Protocolo**                         | Conjunto de reglas que definen cómo se comunican los dispositivos en una red.                           |
| **MAC (Media Access Control)**        | Dirección física única asignada a cada interfaz de red.                                                 |
| **Dirección IP (Internet Protocol)**  | Dirección lógica asignada a cada dispositivo en una red para identificarlo y localizarlo.               |
| **Dirección Loopback**                | Dirección IP especial (`127.0.0.1`) utilizada para designar la propia máquina en una red.               |
| **Dirección Broadcast**               | Dirección IP especial utilizada para enviar datos a **todos** los dispositivos en una red.              |
| **Router**                            | Dispositivo que dirige el tráfico de datos entre diferentes redes.                                      |
| **NAT (Network Address Translation)** | Técnica que permite a múltiples dispositivos en una red local compartir una única dirección IP pública. |
| **Switch**                            | Dispositivo que conecta múltiples dispositivos en una red local y gestiona el tráfico de datos.         |
| **Firewall**                          | Sistema de seguridad que controla el tráfico de red entrante y saliente.                                |
| **DNS (Domain Name System)**          | Sistema que traduce nombres de dominio en direcciones IP.                                               |
| **VPN (Virtual Private Network)**     | Red privada que utiliza una conexión pública para proporcionar acceso seguro a los usuarios remotos.    |

### Protocolos Comunes

| Protocolo                                      | Definición                                                                            |
| ---------------------------------------------- | ------------------------------------------------------------------------------------- |
| **IP (Internet Protocol)**                     | Protocolo que **define cómo se envían** los datos a través de una red.                |
| **TCP (Transmission Control Protocol)**        | Protocolo que **garantiza la entrega** fiable de datos entre dispositivos en una red. |
| **UDP (User Datagram Protocol)**               | Protocolo que permite la transmisión de datos **sin garantía de entrega**.            |
| **DHCP (Dynamic Host Configuration Protocol)** | Protocolo que **asigna dinámicamente direcciones IP** a los dispositivos en una red.  |
| **ARP (Address Resolution Protocol)**          | Protocolo que **traduce direcciones IP en direcciones MAC** en una red local.         |
| **HTTP (HyperText Transfer Protocol)**         | Protocolo utilizado para la transferencia de páginas web.                             |
| **HTTPS (HTTP Secure)**                        | Versión segura de HTTP que utiliza cifrado para proteger los datos transmitidos.      |
| **FTP (File Transfer Protocol)**               | Protocolo utilizado para la transferencia de archivos entre dispositivos.             |
| **SMTP (Simple Mail Transfer Protocol)**       | Protocolo utilizado para el envío de correos electrónicos.                            |
| **IMAP (Internet Message Access Protocol)**    | Protocolo utilizado para la recepción y almacenamiento de correos electrónicos.       |
| **POP3 (Post Office Protocol 3)**              | Protocolo utilizado para la descarga de correos electrónicos desde un servidor.       |
| **SSH (Secure Shell)**                         | Protocolo que permite el acceso seguro a dispositivos remotos a través de una red.    |

### Puertos Comunes

| Puerto | Protocolo  | Uso                                     |
| ------ | ---------- | --------------------------------------- |
| 20     | FTP        | Transferencia de datos FTP              |
| 21     | FTP        | Control de conexión FTP                 |
| 22     | SSH        | Acceso remoto seguro                    |
| 25     | SMTP       | Envío de correos electrónicos           |
| 53     | DNS        | Resolución de nombres de dominio        |
| 67     | DHCP       | Asignación de direcciones IP (servidor) |
| 68     | DHCP       | Asignación de direcciones IP (cliente)  |
| 80     | HTTP       | Transferencia de páginas web            |
| 110    | POP3       | Descarga de correos electrónicos        |
| 143    | IMAP       | Recepción y almacenamiento de correos   |
| 443    | HTTPS      | Transferencia segura de páginas web     |
| 3306   | MySQL      | Acceso a bases de datos MySQL           |
| 5432   | PostgreSQL | Acceso a bases de datos PostgreSQL      |
| 6379   | Redis      | Acceso a bases de datos Redis           |
| 27017  | MongoDB    | Acceso a bases de datos MongoDB         |

### Comando de Redes en Linux

| Comando      | Descripción                                                                       |
| ------------ | --------------------------------------------------------------------------------- |
| `ifconfig`   | Muestra o configura las interfaces de red en sistemas Unix.                       |
| `ip addr`    | Muestra o configura las direcciones IP y las interfaces de red.                   |
| `ping`       | Envía paquetes ICMP para comprobar la conectividad de red.                        |
| `traceroute` | Muestra la ruta que siguen los paquetes hasta un destino.                         |
| `netstat`    | Muestra las conexiones de red, tablas de enrutamiento y estadísticas de interfaz. |
| `nslookup`   | Consulta servidores DNS para resolver nombres de dominio.                         |
| `dig`        | Herramienta avanzada para consultas DNS.                                          |
| `tcpdump`    | Captura y analiza paquetes de red en tiempo real.                                 |
| `nmap`       | Escanea puertos y detecta servicios en dispositivos de red.                       |
| `nmcli`      | Gestiona y administra conexiones de red en Network Manager.                       |
| `route`      | Muestra o modifica la tabla de enrutamiento IP.                                   |
| `wget`       | Descarga archivos desde la web a través de HTTP, HTTPS o FTP.                     |
| `curl`       | Transfiere datos desde o hacia un servidor utilizando varios protocolos.          |
| `ssh`        | Permite el acceso seguro a dispositivos remotos a través de una red.              |
| `scp`        | Copia archivos de forma segura entre hosts en una red.                            |
| `ftp`        | Cliente para la transferencia de archivos mediante el protocolo FTP.              |

### Direcciones IP públicas vs privadas

| Tipo         |                                  Rango de Direcciones IP                                  | Uso                      |
| ------------ | :---------------------------------------------------------------------------------------: | ------------------------ |
| **Públicas** |                       Asignadas por IANA y<br>gestionadas por ISPs                        | Acceso a Internet        |
| **Privadas** | 10.0.0.0 - 10.255.255.255<br>172.16.0.0 - 172.31.255.255<br>192.168.0.0 - 192.168.255.255 | Redes locales y privadas |

### Casos de uso

**Conexión a una red WiFi desde la terminal:**

```bash
nmcli dev wifi connect "SSID_de_la_Red" password "tu_contraseña"
```

**Saber los servidores DNS configurados:**

```bash
cat /etc/resolv.conf
# o también:
nmcli dev show | grep 'DNS'
```

**Comprobar la conectividad a un sitio web:**

```bash
ping www.ejemplo.com
```
