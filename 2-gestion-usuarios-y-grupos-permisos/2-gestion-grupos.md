# Gestión de grupos en Linux

## Ficheros para gestionar grupos en Linux

Para permitir una administración flexible de los permisos de los usuarios, Linux permite **estructurar los usuarios a través de grupos** y los **permisos** pueden ser **asignados** a un grupo.

La organización de usuarios en grupos de usuarios, permite otorgar **diferentes permisos a cada grupo**, y de esta forma gestionar “en bloque” qué grupos tienen permiso y para qué.

_Ejemplo: El grupo de usuarios "desarrolladores" puede tener permisos de escritura en el directorio `/var/www/html`, mientras que el grupo "usuarios" solo tiene permisos de lectura._

**Todos los usuarios en Linux pertenecen a al menos un grupo (principal o primario),** pero pueden pertenecer a varios grupos adicionales (secundarios).

Grupos primarios solamente hay uno.

Los grupos de usuarios solo pueden contener usuarios, no pueden contener otros grupos. **Linux no permite jerarquías de grupos.**

Cada grupo de usuarios tiene un identificador único llamado **GID** _(Group ID o Group Identifier)_. Internamente, el sitema realiza las gestiones bajo el GID, no por el nombre del grupo.

Normalmente, en el momento de **crear grupos**, el sistema le **asigna un gid de 1000 en adelante**. Los GID del 0 al 999 están reservados para uso del sistema y sus grupos especiales.

## Ficheros importantes para la gestión de grupos

La información de los usuarios se guarda en el fichero `/etc/passwd` y la de los grupos en el fichero `/etc/group`.

### `/etc/passwd`

Este archivo contiene la **información básica de los usuarios** del sistema.

Información contenida en `/etc/passwd`:

```bash
cat /etc/passwd
```

Salida:

```plaintext
nombre_usuario:x:UID:GID:Información adicional:Directorio personal:Shell predeterminada
```

Ejemplo:

```plaintext
rocio:x:1001:1001:Rocío Benítez:/home/rocio:/bin/bash
```

Cada línea representa un usuario y contiene varios campos separados por dos puntos (`:`):

| Campos        | Descripción                                                                                  |
| ------------- | -------------------------------------------------------------------------------------------- |
| Nombre usuario| Nombre del usuario                                                                           |
| Passwd        | Contraseña cifrada del usuario (generalmente está vacío o contiene una 'x' si se usa `/etc/shadow`) |
| UID           | Identificador único (numérico) del usuario                                                     |
| GID           | Identificador único (numérico) del grupo primario del usuario                                      |
| GECOS         | Información adicional sobre el usuario (nombre completo, teléfono, etc.)                             |
| Home          | Ruta del directorio personal del usuario                                                        |
| Shell         | Ruta del intérprete de comandos (shell) predeterminado del usuario                                 |

### `/etc/group`

Este archivo contiene la información de los grupos del sistema.

Información contenida en `/etc/group`:

```bash
cat /etc/group
```

Salida:

```plaintext
nombre_grupo:Passwd:GID:Miembros
```

Ejemplo:

```plaintext
developers:x:1002:rocio,alejandro
```

Cada línea representa un grupo y contiene el nombre del grupo, su GID (Group ID) y los usuarios que pertenecen a él.

| Campos   | Descripción                                                                                |
| -------- | ------------------------------------------------------------------------------------------ |
| Grupo    | Nombre del grupo                                                                           |
| Passwd   | Contraseña del grupo (generalmente está vacío o contiene una 'x' si se usa `/etc/gshadow`) |
| GID      | Identificador único (numérico) del grupo                                                   |
| Miembros | Lista separada por comas con los nombres de los usuarios que pertenecen al grupo           |

### `/etc/gshadow`

Este archivo **almacena información sobre las contraseñas** de los grupos y los administradores de cada grupo. Solo es accesible por el usuario **root**.

`*` indica que el usuario nunca ha tenido contraseña.

`!` significa que la cuenta ha sido deshabilitada para loguearse mediante contraseña.

## Comandos de gestión de grupos en Linux

| Comando    | Descripción                                  |
| ---------- | -------------------------------------------- |
| `groups`   | Muestra los grupos a los que pertenece un usuario |
| `groupadd` | Crea un nuevo grupo en el sistema            |
| `newgrp`   | Cambia temporalmente el grupo del usuario    |
| `useradd`  | Crea un nuevo usuario y lo asigna a un grupo |
| `passwd`   | Asigna una contraseña a un usuario           |
| `gpasswd`  | Cambia la contraseña de un grupo             |
| `groupmod` | Modifica un grupo existente                  |
| `gpasswd`  | Elimina la password de un grupo              |
| `deluser`  | Saca un usuario de un grupo o varios         |
| `groupdel` | Elimina un grupo del sistema                 |

### `groups`

Muestra todos los grupos a los que pertenece el usuario actual:

```bash
groups
```

Salida:

```plaintext
rocio adm cdrom sudo dip developers
```

Muestra los grupos a los que pertenece un usuario

```bash
groups nombre_usuario
```

### `groupadd` - Crea un nuevo grupo en el sistema

Para administrar usuarios u grupos hay que tener permisos de administrador (root).

En general habrá que crear primero los grupos y luego los usuarios.

```bash
root@mi-maquina:~$ sudo groupadd nombre_grupo
```

Al crear un grupo, el sistema le asigna automáticamente un GID a partir del 1000.

Verificamos que el grupo se ha creado correctamente:

```bash
root@mi-maquina:~$ getent group nombre_grupo
nombre_grupo:x:1001:
```

### `newgrp` - Cambiar temporalmente el grupo al que pertecnece el usuario

```bash
sudo newgrp nombre_grupo
```

- **Grupo real:** Es el grupo primario al que pertenece el usuario cuando inicia sesión. Consta en el archivo `/etc/passwd`.
- **Grupo efectivo:** Es el grupo que se utiliza para determinar los permisos de acceso a archivos y recursos mientras el usuario está logueado. Puede ser cambiado temporalmente usando el comando `newgrp`.

### `useradd` - Crear un usuario y asignarlo a un grupo específico

```bash
sudo useradd nombre_grupo nombre_usuario
```

Usando **flags adicionales** podemos personalizar la creación del usuario:

| Flag      | Descripción                                         |
| --------- | --------------------------------------------------- |
| `-g`      | Especifica el grupo primario del nuevo usuario      |
| `-G`      | Especifica los grupos secundarios del nuevo usuario |
| `-m`      | Crea el directorio personal del nuevo usuario       | 
| `-s`      | Especifica la shell del nuevo usuario               |
| `-p`      | Especifica la contraseña cifrada del nuevo usuario   |

```bash
sudo useradd -g nombre_grupo -m -s /bin/bash nombre_usuario
```

### `passwd` - Asignar una contraseña al nuevo usuario

Se debe asignar una password al nuevo usuario mediante el comando `passwd`:

```bash
sudo passwd nombre_usuario
```

Ahora el usuario `nombre_usuario` pertenece al grupo `nombre_grupo` y puede iniciar sesión en el sistema:

```bash
su nombre_usuario
```

### `gpasswd` - Cambiar la contraseña de un grupo

```bash
sudo gpasswd nombre_grupo
```

### `groupmod` - Modifica un grupo existente

```bash
sudo groupmod -n nuevo_nombre_grupo nombre_grupo
```

### `gpasswd` - Eliminar la password de un grupo

```bash
sudo gpasswd -r nombre_grupo
```

### `deluser` - Sacar un usuario de un grupo o varios

```bash
sudo deluser nombre_usuario # Sacar usuario de todos los grupos secundarios
sudo deluser nombre_usuario nombre_grupo # Sacar usuario de un grupo específico
```

### `groupdel` - Elimina un grupo de usuarios

```bash
sudo groupdel nombre_grupo
```
