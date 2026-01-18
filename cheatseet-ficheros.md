# Directorios y Ficheros en Linux

| Directorio | Fichero             | Descripción                                                                                                             |
| ---------- | ------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `/etc`     | `/passwd`           | Contiene la información básica de los **usuarios** del sistema.                                                         |
|            | `/shadow`           | Almacena las **contraseñas cifradas** de los **usuarios** y otra información relacionada con la gestión de contraseñas. |
|            | `/group`            | Contiene la información de los **grupos** de usuarios del sistema.                                                      |
|            | `/gshadow`          | Almacena las **contraseñas** de los **grupos** y los administradores de cada grupo.                                     |
|            | `/default/useradd`  | Valores por defecto usados cuando se crea un usuario nuevo con el comando `useradd`.                                    |
|            | `/useradd.conf`     | Valores por defecto usados cuando se crea un usuario nuevo con el comando `adduser`.                                    |
|            | `/apt/sources.list` | Lista de **repositorios** de software para sistemas basados en Debian (como Ubuntu).                                    |
| `/home`    |                     | Directorios personales de los usuarios. Cada usuario tiene su propio subdirectorio dentro de `/home`.                   |
| `/root`    |                     | Directorio personal del usuario root (administrador del sistema).                                                       |
| `/tmp`     |                     | Directorio temporal utilizado para almacenar archivos temporales creados por el sistema y las aplicaciones.             |
| `/var/log` | `syslog`            | Archivo de registro que contiene mensajes del sistema y de diversas aplicaciones.                                       |
|            | `auth.log`          | Archivo de registro que contiene eventos relacionados con la **autenticación** y la seguridad del sistema.              |
| `/dev`     |                     | Contiene archivos especiales que representan dispositivos de hardware y periféricos conectados al sistema.              |
| `/proc`    |                     | Sistema de archivos virtual que proporciona información sobre los procesos en ejecución y el estado del sistema.        |
| `/mnt`     |                     | Punto de montaje temporal para sistemas de archivos montados manualmente.                                               |
| `/media`   |                     | Punto de montaje para dispositivos extraíbles como USBs y CDs.                                                          |
