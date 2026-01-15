# Gestión de usuarios en Linux

## Ficheros para gestionar usuarios

El concepto de usuario en Linux permite separar entornos de ejecución para diferentes propósitos permitiendo trabajar dos usuarios de manera simultánea en el mismo sistema, teniendo cada uno un usuario diferente y un directorio personal(home) diferente.

En los sistemas o plataformas multiusuario es muy común que muchos **servicios internos** del sistema tengan **su propio usuario** para **restringir el acceso** de ese servicio como mecanismo de seguridad.

Este modo de funcionamiento es muy normal en el ámbito de la ciberseguridad, de forma que, si un servicio ve su seguridad comprometida por un ataque, el acceso que tenga el usuario de ese servicio servirá como contención del ataque, y no podrá acceder a ficheros pertenecientes a otros usuarios (de persona o servicio).

### `/etc/default/useradd`

Valores por defecto usados cuando se crea un usuario nuevo con el comando `useradd`.

### `/etc/useradd.conf`

Valores por defecto usados cuando se crea un usuario nuevo con el comando `adduser`.

### `/etc/passwd`

Este archivo contiene la **información básica de los usuarios** del sistema.

Cada línea representa un usuario y contiene varios campos separados por dos puntos (`:`).

### `/etc/shadow`

Este archivo almacena las contraseñas cifradas de los usuarios y otra información relacionada con la gestión de contraseñas. Solo es accesible por el usuario **root**.

`*` indica que el usuario nunca ha tenido contraseña.

`!` significa que la cuenta ha sido deshabilitada para loguearse mediante contraseña.


## Creación de usuarios

Al crear un usuario, se asigna un **UID** (User ID) único y se crea un grupo para ese usuario y un **GID** (Identificador Único de Grupo) para ese grupo del nuevo usuario.

### `useradd`

**Opciones comunes:**

| Opción            | Descripción                                                |
| ----------------- | ---------------------------------------------------------- |
| `-m`              | Crea el directorio home del usuario si no existe.          |
| `-G <grupos>`     | Añade el usuario a grupos adicionales separados por comas. |
| `-d <directorio>` | Especifica el directorio home del usuario.                 |
| `-s <shell>`      | Especifica la shell por defecto del usuario.               |

**Crear un usuario que pertenezca a un grupo específico:**

```bash
sudo useradd -g grupo1 -d /home/usuario1 -m -s /bin/bash usuario1
```

_(podemos usar el script `adduser` que es más amigable, nos guía en la creación del usaurio, y hace lo mismo)_

**Crear un usuario que pertenezca a varios grupos:**

```bash
sudo useradd -G grupo1,grupo2 -d /home/usuario2 -m -s /bin/bash usuario2
```

**Comprobar la creación del usuario:**

```bash
cat /etc/passwd | grep usuario1
```

**Verificar en el fichero de grupos `/etc/group`:**

```bash
cat /etc/group | grep grupo1
```

Si el grupo al que vamos a asignar el usuario no existe, podemos crearlo con el comando `groupadd`.

_(Todo usuario pertenece a un grupo primario y puede pertenecer a varios grupos secundarios)_

### Asignar contraseña a un usuario

```bash
sudo passwd usuario1
```

Primero nos pedirá la password del usuario "admin" (o del usuario con privilegios sudo) y luego nos pedirá la nueva contraseña para el usuario "usuario1".

### Ver los grupos creados en el sistema

```bash
cat /etc/group
```

Ejemplo de salida:

```
root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
adm:x:4:syslog,usuario1
tty:x:5:
```

### Ver los usuarios del sistema

**Con `cat`:**

```bash
sudo cat /etc/passwd # Muestra todo el contenido del fichero
sudo cat /etc/passwd | cut -d":" -f1 # Muestra solo los nombres de usuario
```

**Con `less` y `more`:**

```bash
sudo less /etc/passwd
sudo more /etc/passwd
```

## Modificación de usuarios

### `usermod`

**Modificar el directorio de trabajo del usuario:**

```bash
sudo usermod -d /nuevo/directorio usuario1
```

Comprobar el cambio:

```bash
cat /etc/passwd | grep usuario1
```

**Renombrar un usuario:**

```bash
sudo usermod -l nuevo_nombre_usuario usuario1
```

**Modificar el grupo principal de un usuario:**

```bash
sudo usermod -g nuevo_grupo usuario1
```

**Modificar la fecha de expiración de la cuenta de un usuario:**

```bash
sudo usermod -e AAAA-MM-DD usuario1
```

Ejemplo:

```bash
sudo usermod -e 2025-12-31 rocio
```

Ahora la cuenta del usuario "rocio" expirará el 31 de diciembre de 2025.

**Bloquear una cuenta de usuario:**

```bash
sudo usermod -L usuario1
```

**Desbloquear una cuenta de usuario:**

```bash
sudo usermod -U usuario1
```

**Modificar el UID de un usuario:**

```bash
sudo usermod -u NUEVO_UID usuario1
```

**Agregar información a la cuenta de un usuario (nombre completo, teléfono, etc.):**

```bash
sudo usermod -c "Nombre Completo, Teléfono, etc." usuario1
```

### `chage`

Permite modificar la información relacionada con la expiración de la contraseña y la cuenta de un usuario.

**Ver la información de expiración de la cuenta de un usuario:**

```bash
sudo chage -l usuario1
```

Ejemplo de salida:

```bash
Last password change                                    : May 01, 2024
Password expires                                        : Jul 30, 2024
Password inactive                                       : never
Account expires                                         : Dec 31, 2025
Minimum number of days between password change          : 0
Maximum number of days between password change          : 90
Number of days of warning before password expires       : 7
```

### `userdel`

**Eliminar un usuario sin borrar su directorio home:**

```bash
sudo userdel usuario1
```

Lógicamente desaparecerá del fichero `/etc/passwd` y ya no podrá iniciar sesión en el sistema.

## Tabla resumen de comandos

| Comando      | Descripción                                                      |
| ------------ | ---------------------------------------------------------------- |
| `useradd`    | Crear un nuevo usuario                                           |
| `useradd -m` | Crear un nuevo usuario y su directorio home                      |
| `useradd -G` | Crear un nuevo usuario y asignarlo a varios grupos               |
| `useradd -d` | Crear un nuevo usuario con un directorio home específico         |
| `useradd -s` | Crear un nuevo usuario con una shell específica                  |
| `passwd`     | Asignar o cambiar la contraseña de un usuario                    |
| `usermod`    | Modificar la información de un usuario existente                 |
| `usermod -l` | Renombrar un usuario                                             |
| `usermod -g` | Modificar el grupo principal de un usuario                       |
| `usermod -e` | Modificar la fecha de expiración de la cuenta                    |
| `usermod -L` | Bloquear una cuenta de usuario                                   |
| `usermod -U` | Desbloquear una cuenta de usuario                                |
| `usermod -u` | Modificar el UID de un usuario                                   |
| `usermod -c` | Agregar información a la cuenta de un usuario                    |
| `chage`      | Modificar la información de expiración de la cuenta y contraseña |
| `userdel`    | Eliminar un usuario                                              |
