# Ejercicios de Gestión de Usuarios, Grupos y Permisos

## Usuarios y Grupos

### Ejercicio: Mostrar usuarios y grupos

Mostrar los usuarios dados de alta en el sistema y al grupo que pertenecen (solo esta información).

```bash
cut -d: -f1,4 /etc/passwd
```

### Ejercicio: Crear usuarios y grupos

1. Crear el grupo `devops`.
2. Crear el usuario `elena` en el grupo `devops` con directorio de usuario y uso de bash como shell.
3. Verificar que el usuario `elena` se ha creado correctamente y pertenece al grupo `devops`.
4. Crear el usuario `juan` con UID 1010 en el grupo `devops`.
5. Verificar y comparar `elena` y `juan`.
6. Asignar una contraseña al usuario `elena`.
7. Verificar y comparar con `juan`.
8. Añadir `elena` al grupo `ceo`.
9. Verificar los grupos de `elena`.

```bash
groupadd devops
useradd -m -s /bin/bash -g devops elena
id elena  # o también:
cat /etc/passwd | grep elena
useradd -g devops -u 1010 juan
id juan  # o también:
cat /etc/passwd | grep juan
passwd elena
id elena  # o también:
cat /etc/shadow | grep elena
usermod -aG ceo elena
id elena  # o también:
groups elena
```

### Ejercicio: Crear grupo y usuario con configuración personalizada

Crea un grupo llamado `desarrollo`. Luego, crea un usuario llamado `programador1` que pertenezca al grupo `desarrollo` como grupo principal, que tenga su carpeta home en `/home/proyectos/prog1` (no la por defecto) y que use `/bin/bash` como su shell por defecto.

```bash
groupadd desarrollo
useradd -m -d /home/proyectos/prog1 -s /bin/bash -g desarrollo programador1
```

### Ejercicio: Añadir usuario a grupo sin cambiar grupo principal

Añade el usuario `programador1` al grupo `sudo` (o `adm`) para que tenga permisos administrativos, pero **sin sacarlo de su grupo principal**.

```bash
usermod -aG sudo programador1
```

> **Diferencia entre `-g` y `-G`:**
>
> - `-g` se usa para definir el **grupo principal** del usuario.
> - `-G` se usa para definir **grupos adicionales** a los que pertenece el usuario.

### Ejercicio: Verificar identidad y grupos de un usuario

Loguéate como ese usuario y demuestra qué UID y GID tiene y a qué grupos pertenece.

```bash
sudo -u programador1
id
```

### Ejercicio: Modificación de cuentas

Te has equivocado. Cambia el nombre del usuario `programador1` a `dev_senior` y bloquea su cuenta para que no pueda entrar temporalmente.

```bash
usermod -l dev_senior programador1
usermod -L dev_senior
```

> **Nota:** Para desbloquear la cuenta, usa `usermod -U dev_senior`.

> `usermod -l` para el cambio de nombre de usuario y `usermod -L` para bloquear la cuenta _(Lock)_.

### Ejercicio: Caducidad de cuenta

Configura la cuenta para que expire automáticamente el 31 de diciembre de este año.

```bash
usermod -e 2024-12-31 dev_senior
```

Verifica la caducidad de la cuenta.

```bash
chage -l dev_senior
```

### Ejercicio: Política de expiración y caducidad (hardening)

Crea el usuario `dev_exam` y aplica:

- La cuenta caduca el **31-12-2026**.
- La contraseña debe cambiarse cada **30 días**.
- Aviso de expiración **7 días** antes.
- Bloqueo de cuenta tras **14 días** de inactividad desde la expiración.

```bash
useradd dev_exam
usermod -e 2026-12-31 dev_exam
chage -M 30 -W 7 -I 14 dev_exam
```

Verifica:

```bash
sudo chage -l dev_exam
```

### Ejercicio: Forzar “primer login” + restablecimiento seguro

En un onboarding masivo necesitas:

- Crear el usuario `onboard1`.
- Asignar una contraseña temporal.
- Forzar cambio de contraseña en el primer inicio de sesión.

Verifica:

```bash
useradd onboard1
passwd onboard1
sudo passwd -S onboard1
sudo chage -l onboard1
```

### Ejercicio: Interpretación de `/etc/passwd`

Ejecuta `cat /etc/passwd | grep dev_senior`. ¿Qué significa la `x` que aparece en el segundo campo?

La `x` en el segundo campo de la entrada del usuario en `/etc/passwd` indica que la contraseña del usuario está almacenada en el archivo `/etc/shadow`, que es un archivo más seguro y protegido donde se guardan las contraseñas cifradas. Esto es una práctica común en sistemas Linux para mejorar la seguridad de las contraseñas de los usuarios.

### Ejercicio: Análisis de `/etc/shadow`

Visualiza la línea de tu usuario en `/etc/shadow`. Identifica el campo de la contraseña cifrada. Si vieras un `!` o un `*` al principio del hash, ¿qué significaría?

El campo de la contraseña cifrada en `/etc/shadow` es el **segundo** campo de la línea correspondiente al usuario. Un `!` al principio del hash de la contraseña, significa que la cuenta está **bloqueada** y un `*` significa que el usuario **no puede iniciar sesión** utilizando una contraseña.

### Ejercicio: Cambio de identidad

Estás como usuario normal. Pásate al usuario `root` cargando todas sus variables de entorno (como si iniciaras sesión limpia). Luego vuelve a tu usuario.

```bash
sudo -i
exit
```

## Permisos y Máscaras

### Ejercicio: Interpretación de permisos

Crea un fichero nuevo llamado `prueba.txt`. Mira sus permisos con `ls -l`. ¿Por qué son esos?

```bash
touch prueba.txt
ls -l prueba.txt
```

Los permisos por defecto de un fichero nuevo son determinados por la **umask** del usuario. La umask define qué permisos se deben **quitar** de los permisos máximos posibles (666 para ficheros y 777 para directorios). Por ejemplo, si la umask es 022, los permisos resultantes para un fichero serán 644 (666 - 022) (`rw-r--r--`).

### Ejercicio: Permisos simbólicos y numéricos (octales)

Tienes el archivo `secreto.doc`.

- Asígnale permisos de lectura y escritura para el dueño, lectura para el grupo, y nada para el resto usando números (octal).
- Después, quítale el permiso de lectura al grupo y dáselo de escritura al dueño usando letras (simbólico).

```bash
touch secreto.doc
chmod 640 secreto.doc
chmod g-r,u+w secreto.doc
```

### Ejercicio: Cambio de propietario

Haz que el archivo `secreto.doc` pertenezca al usuario `root` y al grupo `root` en una sola línea.

```bash
sudo chown root:root secreto.doc
```

### Ejercicio: Configuración y verificación de umask

1. Verifica la máscara del usuario de la sesión actual.
2. Crea un fichero `testfile.txt` en tu directorio home.
3. ¿Cuáles son los permisos del fichero creado?
4. Verifica.
5. Cambia a usuario root
6. Verifica la máscara de usuario.
7. Crea otro fichero con el nombre `testfile_root.txt` en el home de root.
8. ¿Cuáles son los permisos del fichero creado?
9. Verifica.

```bash
umask
touch ~/testfile.txt
ls -l ~/testfile.txt
# 666-002=664 > 110110100 > rw-rw-r--
sudo -i
umask
touch /root/testfile_root.txt
# 666-022=644 > 110100100 > rw-r--r--
ls -l /root/testfile_root.txt
```

> Recomendación: crea un directorio de laboratorio:
>
> ```bash
> sudo mkdir -p /srv/lab && sudo chmod 755 /srv/lab
> ```

### Ejercicio: Crear usuario de aplicación con mínimos privilegios

Tu equipo despliega un servicio llamado `inventory-api` que debe ejecutarse con un usuario sin login interactivo.

- Crea el usuario de sistema `svc_inventory` con `home` en `/var/lib/inventory`.
- El usuario **no** debe tener shell interactiva.
- Crea la carpeta de logs `/var/log/inventory` propiedad del usuario.

```bash
useradd -r -d /var/lib/inventory -s /usr/sbin/nologin svc_inventory
mkdir -p /var/log/inventory
chown svc_inventory:svc_inventory /var/log/inventory
```

> `useradd -r` indica que el nuevo usuario es de sistema (UID < 1000, sin login, sin caducidad).<br>
> Se utiliza para ejecutar servicios o demonios (como Apache, MySQL, etc.) con privilegios limitados.

Verifica:

```bash
getent passwd svc_inventory
sudo -u svc_inventory id
ls -ld /var/lib/inventory /var/log/inventory
```

## Permisos especiales

### Ejercicio: SUID (Set User ID)

Busca el comando `/usr/bin/passwd` con `ls -l`. ¿Ves una `s` en lugar de una `x`? ¿Qué significa eso y por qué es peligroso ponérselo a un script tuyo?

El bit SUID (Set User ID) permite que un programa **se ejecute con los privilegios del propietario del archivo**, en lugar de los privilegios del usuario que lo ejecuta. En el caso de `/usr/bin/passwd`, esto es necesario porque cambiar una contraseña requiere privilegios elevados (normalmente del usuario root).

### Ejercicio: SGID (Set Group ID)

Crea una carpeta `/compartida`. Asígnale el **bit SGID**. Crea un archivo dentro con tu usuario. Verifica de qué grupo es el archivo nuevo.

```bash
mkdir /compartida
chmod 2775 /compartida
touch /compartida/archivo_compartido
ls -l /compartida/archivo_compartido
```

### Ejercicio: Sticky Bit

Configura un directorio `/publico` para que todos puedan escribir (`777`), pero activa el Sticky Bit para que `Pepe` no pueda borrar los archivos de `María`.

```bash
mkdir /publico
chmod 1777 /publico
```

### Ejercicio: Directorio tipo /tmp con Sticky Bit

Crea `/srv/dropbox` para intercambio entre usuarios (todos pueden crear), pero:

- Nadie puede borrar/renombrar ficheros de otro.
- El directorio debe ser accesible para todos.

```bash
mkdir /srv/dropbox
chmod 1777 /srv/dropbox
```

Verifica (intenta borrar como otro usuario y documenta el resultado):

```bash
ls -ld /srv/dropbox
```

Resultado: Los usuarios pueden crear archivos en `/srv/dropbox`, pero no pueden borrar o renombrar archivos creados por otros usuarios debido al sticky bit (`t` en los permisos).

## Grupos, colaboración y control de acceso

4. **Diseño de grupos para un proyecto**

   Para un proyecto con repos y despliegues define:
   - Grupo `devops` (operaciones y despliegue)
   - Grupo `backend` (desarrollo)

   Crea usuarios `alice`, `bob`, `carol` con estas reglas:
   - `alice`: `backend`
   - `bob`: `backend` + `devops`
   - `carol`: `devops`

   Verifica:

   ```bash
   id alice
   id bob
   id carol
   getent group backend
   getent group devops
   ```

5. **Directorio compartido con herencia de grupo (setgid)**

   Se necesita una zona compartida para el equipo `backend` en `/srv/repos/backend`:
   - Propiedad: `root:backend`
   - Permisos: el grupo puede leer/escribir, “otros” sin acceso.
   - Herencia del grupo para nuevos ficheros/directorios (bit SGID en el directorio).

   Verifica:

   ```bash
   ls -ld /srv/repos/backend
   sudo -u alice bash -lc 'touch /srv/repos/backend/prueba_alice && ls -l /srv/repos/backend/prueba_alice'
   ```

6. **Umask por equipo: repos privados por defecto**

   Define una configuración para que los usuarios del equipo (ej. `alice`) creen por defecto:
   - Archivos con `640`
   - Directorios con `750`

   (No hace falta que afecte a todo el sistema: puede ser a nivel de usuario.
   Indica dónde lo configurarías y cómo lo verificarías.)

   Verifica:

   ```bash
   sudo -u alice bash -lc 'umask; umask -S; mkdir -p ~/umask_test && touch ~/umask_test/f && stat -c "%a %n" ~/umask_test ~/umask_test/f'
   ```

## Permisos avanzados: ACL, sticky bit, auditoría

7. **ACL para excepción puntual sin cambiar el grupo**

   En `/srv/repos/backend` el usuario `carol` (no pertenece a `backend`) debe poder **leer** un único fichero `README.md` pero no el resto.
   - Crea `README.md` dentro de `/srv/repos/backend`.
   - Aplica ACL para que `carol` tenga `r--` sobre ese fichero.
   - Asegúrate de que la máscara de ACL no elimina el permiso.

   Verifica:

   ```bash
   getfacl /srv/repos/backend/README.md
   sudo -u carol bash -lc 'cat /srv/repos/backend/README.md'
   sudo -u carol bash -lc 'ls -l /srv/repos/backend || true'
   ```

8. **ACL por defecto en directorio compartido**

   En `/srv/repos/backend` necesitas que cualquier fichero nuevo tenga automáticamente:
   - Para el grupo `backend`: `rw-`
   - Para el usuario `bob`: `rw-` (aunque cambie de grupo en el futuro)

   Aplica ACL **por defecto** y demuestra con un fichero nuevo que se hereda.

   Verifica:

   ```bash
   getfacl /srv/repos/backend
   sudo -u alice bash -lc 'touch /srv/repos/backend/herencia_acl && getfacl /srv/repos/backend/herencia_acl'
   ```

9. **Directorio tipo /tmp para un equipo (sticky bit)**

10. **Búsqueda y corrección de permisos inseguros**

    En `/srv/lab` crea deliberadamente:
    - Un directorio con permisos `777`
    - Un fichero con permisos `666`

    Luego:
    - Encuentra recursivamente en `/srv/lab` _solo_ los directorios world-writable.
    - Encuentra recursivamente en `/srv/lab` _solo_ los ficheros world-writable.
    - Corrige permisos a un baseline razonable (`755` dir, `644` file) sin tocar nada fuera de `/srv/lab`.

    Verifica:

    ```bash
    find /srv/lab -perm -0002 -type d -print
    find /srv/lab -perm -0002 -type f -print
    ```

## D. Privilegios delegados (sudo) y operación segura

11. **Delegación mínima con `sudoers` (sin dar root total)**

    El equipo `devops` debe poder:
    - reiniciar **solo** el servicio `nginx`
    - ver el estado de `nginx`
    - leer `journalctl` de `nginx`

    Requisitos:
    - Debe configurarse de forma segura (no editar `sudoers` con un editor normal).
    - Evita permitir comandos arbitrarios (no `systemctl *`).

    Verifica:

    ```bash
    sudo -l -U bob
    sudo -u bob sudo systemctl status nginx
    ```

12. **Bloqueo de elevación por PATH y binarios**

    Explica y aplica una medida para evitar que un usuario abuse de `sudo` mediante:
    - alias / funciones
    - scripts colocados antes en `$PATH`

    Pista: piensa en `secure_path` y rutas absolutas.

## E. SSH, despliegue y permisos de claves

13. **Acceso SSH por clave con permisos correctos**

    Para el usuario `alice`:
    - Crea `~/.ssh` y un `authorized_keys`.
    - Ajusta permisos para que SSH no lo rechace.
    - Añade una clave pública ficticia (string de ejemplo) y documenta qué permiso exacto debe tener cada elemento.

    Verifica:

    ```bash
    sudo -u alice bash -lc 'ls -ld ~/.ssh && ls -l ~/.ssh/authorized_keys'
    ```

14. **Gestión de secretos en despliegue (grupo dedicado + setgid)**

    Hay un fichero de secretos `/etc/inventory/secret.env` que:
    - debe ser editable solo por `root`
    - debe ser legible por el usuario de servicio `svc_inventory`
    - no debe ser legible por otros

    Diseña una solución basada en grupo (p.ej. `inventory-secrets`) y permisos.

    Verifica:

    ```bash
    sudo -u svc_inventory bash -lc 'cat /etc/inventory/secret.env'
    sudo -u alice bash -lc 'cat /etc/inventory/secret.env || true'
    ls -l /etc/inventory/secret.env
    ```

15. **Simulación de incidente: corrección de ownership tras copia**

    Un despliegue ha copiado ficheros de aplicación a `/opt/inventory` con ownership incorrecto.
    - Crea `/opt/inventory` con varios ficheros y subdirectorios.
    - Corrige para que TODO quede como `root:svc_inventory` (o un grupo de servicio si lo prefieres), con:
      - directorios `750`
      - ficheros `640`
    - Asegura que el servicio puede leer, pero no escribir en `/opt/inventory`.

    Verifica:

    ```bash
    sudo -u svc_inventory bash -lc 'find /opt/inventory -maxdepth 2 -type f -print -exec head -n 1 {} \;'
    find /opt/inventory -printf '%M %u:%g %p\n' | head
    ```
