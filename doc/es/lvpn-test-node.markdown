% LVPN-TEST-NODE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NOMBRE

Prueba la conexión a un nodo


# SINOPSIS

_lvpn test-node_ [-hvk] nodo-local nodo


# OPCIONES

-h
:    Este mensaje

-v
:    Muestra las pruebas

-k
:    Probar que **nodo** conozca a **nodo-local**


# DESCRIPCION

Comprueba que sea posible conectar **nodo-local** con **nodo**.

Realiza una prueba de conexión a **nodo**.  La prueba puede fallar
temporalmente si **nodo** no está disponible.

Devuelve **0** en caso de éxito y **1** en caso de error.

En caso de usar la opción **-k**, se realizará una prueba adicional para
saber si **nodo** posee el archivo de nodo de **nodo-local**.  Esto no
quiere decir que las llaves coincidan, pero da una pauta de que la
conexión será posible de los dos lados sin intervención manual en
**nodo**.


# EJEMPLOS

## Prueba la conexión de yap a ponape

lvpn test-node yap ponape ; echo $?

## Prueba la conexión y muestra los mensajes

lvpn test-node -v yap ponape

## Prueba la conexión entre yap y ponap

lvpn test-node -k yap ponape


# VEASE TAMBIEN

_lvpn-rotate-nodes(1)_ _nc_
