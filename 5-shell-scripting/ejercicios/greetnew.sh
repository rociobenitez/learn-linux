# SCRIPT: Saludar al usuario
# Este script acepta el nombre del usuario y muestra un saludo personalizado.

echo -n "Introduce tu nombre: "
read NOMBRE_USUARIO

echo -n "Introduce tu primer apellido: "
read APELLIDO_USUARIO
    
echo "Hola, $NOMBRE_USUARIO $APELLIDO_USUARIO"
echo "¡Bienvenido al sistema!"