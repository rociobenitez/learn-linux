# Ejercicios de Gestión de Usuarios, Grupos y Permisos

> Recomendación: crea un directorio de laboratorio:
>
> ```bash
> sudo mkdir -p /srv/lab && sudo chmod 755 /srv/lab
> ```

## A. Identidad, usuarios y políticas

1. **Crear usuario de aplicación con mínimos privilegios**

	Tu equipo despliega un servicio llamado `inventory-api` que debe ejecutarse con un usuario sin login interactivo.

	- Crea el usuario de sistema `svc_inventory` con `home` en `/var/lib/inventory`.
	- El usuario **no** debe tener shell interactiva.
	- Crea la carpeta de logs `/var/log/inventory` propiedad del usuario.

	Verifica:

	```bash
	getent passwd svc_inventory
	sudo -u svc_inventory id
	ls -ld /var/lib/inventory /var/log/inventory
	```

2. **Política de expiración y caducidad (hardening)**

	Crea el usuario `dev_exam` y aplica:

	- La cuenta caduca el **31-12-2026**.
	- La contraseña debe cambiarse cada **30 días**.
	- Aviso de expiración **7 días** antes.
	- Bloqueo de cuenta tras **14 días** de inactividad desde la expiración.

	Verifica:

	```bash
	sudo chage -l dev_exam
	```

3. **Forzar “primer login” + restablecimiento seguro**

	En un onboarding masivo necesitas:

	- Crear el usuario `onboard1`.
	- Asignar una contraseña temporal.
	- Forzar cambio de contraseña en el primer inicio de sesión.

	Verifica:

	```bash
	sudo passwd -S onboard1
	sudo chage -l onboard1
	```

## B. Grupos, colaboración y control de acceso

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

## C. Permisos avanzados: ACL, sticky bit, auditoría

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

	Crea `/srv/dropbox` para intercambio entre usuarios (todos pueden crear), pero:

	- Nadie puede borrar/renombrar ficheros de otro.
	- El directorio debe ser accesible para todos.

	Verifica (intenta borrar como otro usuario y documenta el resultado):

	```bash
	ls -ld /srv/dropbox
	```

10. **Búsqueda y corrección de permisos inseguros**

	En `/srv/lab` crea deliberadamente:

	- Un directorio con permisos `777`
	- Un fichero con permisos `666`

	Luego:

	- Encuentra recursivamente en `/srv/lab` *solo* los directorios world-writable.
	- Encuentra recursivamente en `/srv/lab` *solo* los ficheros world-writable.
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