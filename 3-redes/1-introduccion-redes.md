# Introducción a redes

## Qué es una red

Una **red** es un conjunto de dispositivos interconectados que pueden **comunicarse entre sí para compartir recursos e información**. Estos dispositivos pueden incluir computadoras, servidores, routers, switches, impresoras y otros equipos de red.

## Redes de ordenadores

Una **red de ordenadores** o de equipos informáticos es un conjunto de ordenadores que pueden comunicarse entre sí y compartir recursos proporcionados por nodos de red.

Implica la conexión de al menos dos equipos, ya sea por cable o de forma inalámbrica, para que puedan intercambiar datos.

Ejemplos:

- Redes de Área Local (**LAN**)
- Redes de Área Amplia (**WAN**)
- Todo **Internet**

Todo Internet (o la _World Wide Web_) es una gran **red de redes de ordenadores**.

Actualmente, las redes de ordenadores son más complejas y cuentan con más elementos funcionando como redes cliente-servidor, donde un equipo actúa de servidor ofreciendo información o recursos a otros equipos que actúan como clientes.

La red más sencilla es una red punto a punto (**red _peer-to-peer_**), donde dos equipos están conectados directamente entre sí mediante un cable de red. Ambos equipos pueden acceder a los datos del otro y usar los **recursos compartidos**, como periféricos (por ejemplo, impresoras) o unidades de almacenamiento (virtuales).

Un ejemplo de este tipo de red son las redes WLAN (_Wireless Local Area Networks_ o red de Wi-Fi) donde los diferentes equipos se conectan a un router inalámbrico.

Además, los equipos clientes se pueden comunicar entre sí de manera directa pasando por el router.

Un **recurso de red** es cualquier objeto, como un archivo o documento, que puede ser _identificado_ por la red.

Un objeto es identificable si se le puede asignar un nombre y una dirección únicos que la red puede usar para identificarlo y acceder a él.

Un **nodo de red** es cualquier dispositivo que participa en una red.

Una red puede incluir cualquier dispositivo que no sea necesariamente una computadora, pero que forma parte de la infraestructura de la red. Ejemplos de nodos de red incluyen módems, conmutadores de red, hubs y puntos de acceso wifi.

### Conceptos básicos de redes

| Término                                      | Definición                                                                                                                                                                                                                                             |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Interfaz de red                              | Acceso de comunicación que permite la comunicación de un controlador de dispositivo específico de red y la capa IP (Internet Protocol)                                                                                                                 |
| Ethernet                                     | Tecnología de red de área local cableada (LAN). Es un protocolo de conexión por cable trenzado que se conecta entre módem o módem router (puerta de enlace) al puerto Ethernet de tus dispositivos                                                     |
| Dirección de Loopback o de bucle local       | Las direcciones 127.x.x.x se reservan para designar la propia máquina. Se utilizan para pruebas de red y diagnóstico. La dirección más comúnmente utilizada es 127.0.0.1                                                                               |
| Dirección de Broadcast                       | Dirección especial que permite enviar un paquete a todos los nodos de una red. En IPv4, la dirección de broadcast se representa con todos los bits del host establecidos en 1 (por ejemplo, 192.168.1.255)                                             |
| DHCP (_Dynamic Host Configuration Protocol_) | **Protocolo de configuración dinámica de host.** Protocolo de red que permite a los dispositivos obtener automáticamente una dirección IP y otros parámetros de configuración de red                                                                   |
| DNS (_Domain Name System_)                   | **Sistema de nombres de dominio.** Sistema que traduce nombres de dominio legibles por humanos (como www.ejemplo.com) en direcciones IP numéricas. Por ejemplo, la dirección IP de www.ejemplo.com podría ser 93.184.216.34 (IP pública)               |
| NAT (_Network Address Translation_)          | **Traducción de direcciones de red.** Realiza la función de puente entre los dispositivos de una red local, con IP privadas y red pública, con IP públicas. Ejemplo: nuestro router de casa es el único dispositivo de la red local con una IP pública |

### Internet

La red de ordenadores con más nodos en el mundo es Internet. Internet está basada en un conjunto de protocolos del modelo TCP/IP.

- **IP** es _Internet Protocol_.
- **TCP** significa _Transport Control Protocol_.

La flexibilidad, prestaciones y su evolución continua, ha ocasionado el desplazamiento de redes anteriores, tales como la red ATM, RDSI, SDH, FR, etc.

La arquitectura TCP/IP o Internet es un modelo de 4 capas.

1. **Capa de acceso a la red** o _Network Access Layer_ - Capa física y de enlace de datos
   - Ethernet
   - Token Ring
   - ATM
   - Frame Relay
2. **Nivel de Red** o _Internet Layer_ - La capa **IP**. Define el direccionamiento y encaminamiento de los paquetes de datos entre redes diferentes.
   - IP (_Internet Protocol_): Protocolo principal de la capa de red. Se encarga del direccionamiento y encaminamiento de los paquetes entre redes diferentes.
   - ICMP (_Internet Control Message Protocol_): Protocolo de control que se utiliza para enviar mensajes de error y diagnóstico en la red. Es utilizado por herramientas como `ping` y `traceroute`.
   - ARP (_Address Resolution Protocol_): Protocolo que se utiliza para resolver direcciones IP en direcciones MAC dentro de una red local.
   - IGMP (_Internet Group Management Protocol_): Protocolo utilizado para gestionar la pertenencia a grupos multicast en una red IP.
3. **Nivel de transporte** o _Transport Layer_ - La capa **TCP**. Los dos protocolos más usados con:
   - **TCP** (_Transmission Control Protocol_): asegura la entrega de paquetes IP entre los diferentes nodos de la red, el nodo de destino envía paquetes ACK, cuando se recibe correctamente un paquete, si se ha perdido se retransmite. Se usa para páginas web, transmisión de ficheros, etc.
   - **UDP** (_User Datagram Protocol_): no asegura la entrega de paquetes IP, ya que no se envían ACKs de recepción. Se emplea en flujos de datos en los que no importa recibir paquetes erróneos, y en los que prima la velocidad. Un ejemplo típico y real es la transmisión de videos en streaming, en las que una línea pixelada es admisible.
4. **Capa de aplicación** o _Application Layer_ - Donde residen los protocolos de aplicación como HTTP, FTP, SMTP, DNS, etc.
   - HTTP (_Hypertext Transfer Protocol_): Protocolo utilizado para la transferencia de páginas web y otros recursos en la World Wide Web.
   - FTP (_File Transfer Protocol_): Protocolo utilizado para la transferencia de archivos entre computadoras en una red.
   - SMTP (_Simple Mail Transfer Protocol_): Protocolo utilizado para el envío de correos electrónicos.
   - DNS (_Domain Name System_): Sistema que traduce nombres de dominio legibles por humanos en direcciones IP numéricas.

## Hosts, Clientes y Servidores

Un **host** es un tipo especial de nodo en una red de computadoras: es una computadora que puede funcionar como un servidor o un cliente en una red.

Un **servidor** es una computadora host que puede aceptar una conexión de un host cliente y cumplir con ciertas solicitudes de recursos realizadas por el cliente.

Muchos hosts pueden desempeñar cualquiera de los roles, actuando como **cliente** y **servidor**.

## Paquetes y Pings

Un **paquete de red** es un fragmento de datos formateado que puede ser transmitido a través de una red.

Las redes de computadoras de hoy en día utilizan típicamente protocolos de comunicación que se basan en tales paquetes de información.

Cada paquete consta de dos tipos de datos:

1. la información de control
2. la carga útil

La **información de control** son datos sobre cómo y dónde entregar la carga útil, como las direcciones de red de origen y destino, mientras que la **carga útil** es el mensaje que se envía.

El comando `ping` funciona enviando paquetes especiales de "solicitud de eco" a un host y esperando una respuesta del host.

`ping` es una utilidad disponible en la mayoría de los sistemas operativos que tienen capacidad de red. Linux tiene su propia implementación del comando `ping` que se utiliza para probar y solucionar problemas de conectividad con otros hosts de red.

## URLs y Direcciones IP

**IP** significa "Protocolo de Internet" y define el formato de los datos transmitidos a través de internet o una red local.

Una **dirección IP** es un código utilizado para **identificar de manera única cualquier host en una red**.

Se puede utilizar para establecer una conexión con un host e intercambiar paquetes con él, por ejemplo, utilizando el comando `ping`.

Además de su carga útil, los paquetes IP (un tipo de paquete de red que se ajusta al Protocolo de Internet) contienen las direcciones IP de los hosts de origen y destino.

Una **URL**, más comúnmente conocida como una **dirección web**, significa _Localizador Uniforme de Recursos_.

Una URL identifica de manera única un recurso web y permite acceder a ese recurso. Típicamente, el recurso al que apunta una URL es una página web, pero también puede utilizarse para tareas como transferir archivos, enviar correos electrónicos y acceder a bases de datos.

Por ejemplo, la URL de la página de Wikipedia para URL es `https://en.wikipedia.org/wiki/URL`. Al igual que para una URL típica, su formato indica un protocolo (`https`), un nombre de host (`en.wikipedia.org`) y un nombre de archivo (`/wiki/URL`).

## Direccionamiento IP

### Direccionamiento MAC y Direccionamiento IP

Cada dispositivo de red tiene una **dirección física única** llamada **dirección MAC** (_Media Access Control_). Esta dirección es asignada por el fabricante del dispositivo y se utiliza para la comunicación dentro de una red local. A cada fabricante de dispositivos red se le asigna un rango de direcciones MAC para sus productos.

Ejemplo práctico: Si tienes un ordenador portátil y te conectas a una red Wi-Fi, tu portátil utilizará su dirección MAC para comunicarse con el router Wi-Fi dentro de esa red local.

`54:35:30:7A:3A:BA (módulo WiFi Broadcom)`

Las direcciones MAC se graban de forma inalterable en cada dispositivo que se conecta a la red IP. La dirección MAC también se conoce como **dirección física** y es independiente del protocolo que se utilice.

Hay elementos de red como routers y switches que conocen la relación univoca entre las direcciones MAC y las direcciones IP de una subred, mediante el protocolo ARP.

Los routers, que tienen implementado y activado el protocolo DHCP (Dynamic Host Configuration Protocol), asignan direcciones IP basados en la dirección MAC de los nodos de red.

Uno de los principales parámetros que es necesario configurar en cualquier dispositivo conectado a una red es su dirección IP. La dirección IP es el identificador del dispositivo dentro de una red y debe ser único dentro de los límites de dicha red. El uso, formato, tipos y demás características del direccionamiento IP están incluidos en lo que se conoce como protocolo IP (Internet Protocol) que se indicaba anteriormente.

## Resumen

- Una **red de computadoras** es un conjunto de computadoras que pueden comunicarse entre sí y compartir recursos. Un recurso de red es cualquier objeto, como un archivo o documento, que puede ser identificado por la red. Un nodo de red es cualquier dispositivo que participa en una red.
- Un **host** es una computadora que puede funcionar como un servidor o un cliente en una red. Un servidor es una computadora host que puede aceptar una conexión de un host cliente y satisfacer ciertas solicitudes de recursos realizadas por el cliente.
- Un **paquete de red** es un fragmento de datos formateado que puede ser transmitido a través de una red. El comando `ping` funciona enviando paquetes especiales de ‘solicitud de eco’ a un host y esperando una respuesta del host.
- Una **dirección IP** es un código utilizado para identificar de manera única cualquier host en una red. Una **URL** identifica un recurso web y permite el acceso a ese recurso.
