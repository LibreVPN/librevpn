% LVPN-PEERS(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Lista los pares desconocidos


# SINOPSIS

_lvpn peers_ [/var/log/tinc.lvpn.log]


# OPCIONES

-h
:    Esta ayuda

-c
:    Contar los intentos de conexión fallidos.  Muestra una cuenta de
     las conexiones sin éxito de cada par.


# DESCRIPCION

Busca los nodos que intentan conectarse con el nodo local pero son
rechazados porque la llave no está accesible.

El demonio tincd debe iniciarse con la opción _--logfile_.

Útil para usar en conjunto con _lvpn add-host_.


# VER TAMBIEN

_lvpn-add-host(1)_
