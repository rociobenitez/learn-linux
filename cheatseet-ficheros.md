# Directorios y Ficheros en Linux

| Directorio | Fichero           | Descripción                                                                                                     |
| ---------- | ----------------- | --------------------------------------------------------------------------------------------------------------- |
| `/etc`     | `passwd`          | Contiene la información básica de los usuarios del sistema.                                                     |
| `/etc`     | `shadow`          | Almacena las contraseñas cifradas de los usuarios y otra información relacionada con la gestión de contraseñas. |
| `/etc`     | `group`           | Contiene la información de los grupos de usuarios del sistema.                                                  |
| `/etc`     | `gshadow`         | Almacena las contraseñas de los grupos y los administradores de cada grupo.                                     |
| `/etc`     | `default/useradd` | Valores por defecto usados cuando se crea un usuario nuevo con el comando `useradd`.                            |
| `/etc`     | `useradd.conf`    | Valores por defecto usados cuando se crea un usuario nuevo con el comando `adduser`.                            |
| `/home`    |                   | Directorios personales de los usuarios. Cada usuario tiene su propio subdirectorio dentro de `/home`.           |
| `/root`    |                   | Directorio personal del usuario root (administrador del sistema).                                               |
| `/tmp`     |                   | Directorio temporal utilizado para almacenar archivos temporales creados por el sistema y las aplicaciones.    |
