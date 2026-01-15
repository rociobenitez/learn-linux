# Gestión de servicios en Linux

## Introducción

**Servicios** _(daemons o demonios)_: son programas (procesos) que **se ejecutan en segundo plano** para proporcionar funcionalidades específicas, como servidores web, bases de datos, servicios de red, etc. La gestión adecuada de estos servicios es crucial para el funcionamiento eficiente y seguro de un sistema Linux.

Los nombres de los servicios suelen terminar en `d` o `.service`, por ejemplo:

- `sshd` (servidor SSH)
- `httpd` (servidor web Apache)
- `crond` (programador de tareas)
- `mysql.service` (servidor de bases de datos MySQL)

Para trabajar con servicios se necesitan permisos de superusuario (`root`). Su utilizará el comando `sudo`.

### Ver los servicios activos

```bash
service --status-all

[ + ]  sshd
[ + ]  apache2
[ - ]  mysql
...
```

Otras formas de **ver los servicios activos y su estado**:

```bash
sudo systemctl list-units --type=service --state=running
```

| STATE       | Descripción                                                               |
| ----------- | ------------------------------------------------------------------------- |
| `enabled`   | Servicios habilitados para iniciar automáticamente al arrancar el sistema |
| `disabled`  | Servicios deshabilitados para el arranque automático                      |
| `static`    | Servicios que no pueden ser habilitados o deshabilitados manualmente      |
| `generated` | Servicios generados automáticamente por el sistema                        |

También podemos usar:

```bash
sudo systemctl | grep running  # Muestra todos los servicios en ejecución
```

## Systemd

La mayoría de las distribuciones Linux modernas utilizan **systemd** como sistema de inicialización y gestor de servicios. Systemd proporciona herramientas para gestionar servicios, unidades y dependencias.

### Administración de servicios

```bash
sudo systemctl [operacion] [nombre_servicio]
```

| Operación    | Descripción                                                                          |
| ------------ | ------------------------------------------------------------------------------------ |
| `start`      | Inicia un servicio                                                                   |
| `stop`       | Detiene un servicio                                                                  |
| `restart`    | Reinicia un servicio                                                                 |
| `status`     | Muestra el estado de un servicio                                                     |
| `enable`     | Habilita un servicio para que se inicie automáticamente al arrancar el sistema       |
| `disable`    | Deshabilita un servicio para que no se inicie automáticamente al arrancar el sistema |
| `is-active`  | Comprueba si un servicio está activo                                                 |
| `is-enabled` | Comprueba si un servicio está habilitado para el arranque automático                 |

### Comandos básicos de systemd

| Comando                                | Descripción                                                                          |
| -------------------------------------- | ------------------------------------------------------------------------------------ |
| `systemctl start nombre_servicio`      | Inicia un servicio                                                                   |
| `systemctl stop nombre_servicio`       | Detiene un servicio                                                                  |
| `systemctl restart nombre_servicio`    | Reinicia un servicio                                                                 |
| `systemctl status nombre_servicio`     | Muestra el estado de un servicio                                                     |
| `systemctl enable nombre_servicio`     | Habilita un servicio para que se inicie automáticamente al arrancar el sistema       |
| `systemctl disable nombre_servicio`    | Deshabilita un servicio para que no se inicie automáticamente al arrancar el sistema |
| `systemctl is-active nombre_servicio`  | Comprueba si un servicio está activo                                                 |
| `systemctl is-enabled nombre_servicio` | Comprueba si un servicio está habilitado para el arranque automático                 |

Utilizamos el servicio `ufw` (Uncomplicated Firewall - permite gestionar reglas de firewall de manera sencilla) como ejemplo para gestionar un servicio.

```bash
sudo systemctl status ufw

● ufw.service - Uncomplicated firewall
     Loaded: loaded (/lib/systemd/system/ufw.service; enabled; vendor preset: enabled)
     Active: active (exited) since Mon 2024-06-10 10:00:00 UTC; 1h 30min ago
       Docs: man:ufw(8)
    Process: 1234 ExecStart=/lib/ufw/ufw-init start (code=exited, status=0/SUCCESS)
   Main PID: 1234 (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 4915)
     Memory: 0B
     CGroup: /system.slice/ufw.service
```

```bash
sudo systemctl start ufw
sudo systemctl enable ufw
sudo systemctl stop ufw
sudo systemctl disable ufw
```
