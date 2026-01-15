# Usuario root y comandos básicos

Linux es muy jerárquico, en el sentido de que dependiendo de al grupo al que pertenezcas puedes hacer unas cosas u otras. Así, en función si perteneces a un determinado grupo tienes acceso a determinados archivos, directorios, e incluso, a determinados periféricos.

Por ello, la gestión de usuarios y grupos es fundamental en Linux.

El usuario más importante es el usuario `root`, que es el superusuario del sistema y tiene permisos para hacer cualquier cosa en el sistema.

## Usuario root

- **root** es la cuenta (usuario) de **super usuario** en sistemas operativos tipo Unix y Linux.
- Este usuario tiene acceso completo a todos los comandos y archivos del sistema, sin restricciones.
- Es el **administrador** del sistema, cuenta con el nivel de privilegios más alto y que le permiten controlar totalmente el sistema.
- El resto de usuarios del sitema siempre tendrán un nivel de privilegios inferior al usuario root.

### Uso del usuario root

Debido al alto nivel de privilegios de la cuenta de root, no es aconsejable utilizar la cuenta de root para una simple sesión de uso habitual, ya que pone en riesgo el sistema al garantizar acceso privilegiado a los programas que ejecuta.

Es preferible utilizar una cuenta de usuario normal y, cuando sea necesario, elevar temporalmente los privilegios para realizar tareas administrativas, utilizando comandos como `sudo` o `su`.

Debido al gran poder y peligro que tiene el usuario root, en **Ubuntu** (y otras distribuciones basadas en Ubuntu), por ejemplo, la cuenta de root está **deshabilitada por defecto**.

En realidad no es necesario tener permisos root para las tareas de administración como programar, crear usuarios, gestionar grupos de usuarios... ya que estas tareas se pueden realizar utilizando `sudo` para ejecutar comandos con privilegios elevados temporalmente.

### Usar sudo para ejecutar comandos con privilegios de root

A veces necesitamos ejecutar múltiples comandos y es pesado el tener que estar poniendo `sudo` delante de cada uno de ellos y luego introducir de nuevo la contraseña de nuestro usuario.

Para evitar esto, podemos cambiar a la cuenta de root utilizando el comando `sudo su -` o `sudo -i`, que nos pedirá la contraseña de nuestro usuario y nos dará acceso a una sesión de root hasta que salgamos de ella con el comando `exit`.

```bash
sudo -i # Cambia a la cuenta de root (login como root)
```

O bien:

```bash
sudo su - # Cambia a la cuenta de root (login como root)
```

> `sudo` nos permite ejecutar programas y comandos con el nivel de privilegios de root (superdoer), pero con algunas restricciones definidas dentro del archivo de configuración `/etc/sudoers`.

### Password de root

La _password_ que se pide y que tiene permisos `sudo` es el usuario que creamos cuando se instala el sistema operativo.

El importante fijarse en que cuando estamos utilizando la consola como usuario root, el prompt del terminal cambia para indicarlo. En lugar de ver un `$` al final del prompt, veremos un `#`, que indica que estamos en una sesión de root.

```bash
root@mi-maquina:~#
```

**Cambiar la contraseña de root:** Una vez que estamos en la sesión de root, podemos cambiar la contraseña de root con el comando `passwd`:

```bash
root@mi-maquina:~# passwd root
```

Esto nos pedirá que introduzcamos una nueva contraseña para el usuario root.

Para volver a usar nuestro usuario normal, simplemente escribimos `exit` para salir de la sesión de root:

```bash
root@mi-maquina:~# exit
```

## Comando `su`

El comando `su` _(substitute user - usuario sustituto)_ se utiliza para cambiar de usuario sin cerrar la sesión del usuario actual. Por defecto, si no se especifica ningún usuario, `su` cambia al usuario root.

```bash
su nombre_usuario # Cambia al usuario especificado
```

Este comando se utiliza cuando tenemos que ejecutar comandos con la cuenta de otro usuario, por ejemplo, para probar permisos o ejecutar tareas específicas.

Con `su -l`, podemos iniciar una sesión de login completa como el usuario especificado, cargando su entorno y configuraciones.

```bash
su -l nombre_usuario
```

Esto es útil para simular una sesión completa del usuario al que estamos cambiando.

Con `su -` podemos cambiar al usuario especificado y cargar su entorno de inicio de sesión.

```bash
su - nombre_usuario
```

Si no se especifica ningún usuario, `su -` cambiará al usuario root.

```bash
su -
```

| Comando | Descripción                                                                                                                         |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `su`    | Cambia al usuario root o al usuario especificado.<br>Hereda las variables de entorno del usuario anterior.                          |
| `su -l` | Inicia una sesión de login completa como el usuario especificado.                                                                   |
| `su -`  | Cambia al usuario especificado y carga su entorno de inicio de sesión.<br> No hereda las variables de entorno del usuario anterior. |

## Comando `id`

Muestra el UID (User ID), GID (Group ID) y los grupos a los que pertenece un usuario.

```bash
id nombre_usuario
```

Si no se especifica ningún usuario, muestra la información del usuario actual.

```bash
id
```

En la mayoría de las ocasiones, los administradores del sistema, solamente necesitan parte de la información anterior, y filtran con diferentes opciones la salida del comando `id`.

```bash
id -u nombre_usuario  # Muestra solo el UID
id -un nombre_usuario # Muestra solo el nombre de usuario
id -g nombre_usuario  # Muestra solo el GID
id -gn nombre_usuario # Muestra solo el nombre del grupo principal
```

**Conocer, auditar y monitorizar los grupos a los que pertenece un usuario:**

```bash
id -G nombre_usuario  # Muestra solo los grupos a los que pertenece
id -Gn nombre_usuario # Muestra solo los nombres de los grupos a los que pertenece
```

## Comando `whoami`

Proviene de la concatenación de las palabras en inglés "who am I" (¿quién soy yo?).

Es un comando simple que muestra el **nombre del usuario actual** que está ejecutando la sesión en el sistema.

```bash
whoami
```

Este comando es útil para **verificar** rápidamente qué usuario está activo en la sesión actual, especialmente cuando se trabaja con múltiples usuarios o se han cambiado de usuario utilizando `su` o `sudo`.