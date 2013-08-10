% LVPN-ADD-SUBNET(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

_lvpn add-subnet_ agrega una dirección IP al nodo


# SINOPSIS

_lvpn add-subnet_ [-hvg] -[4|6] [nodo-local] [dirección]


# OPCIONES

-h
:    Ayuda

-v
:    Modo verborrágico, informa todo lo que se está haciendo

-g
:    Generar la dirección IP automáticamente en lugar de esperar una
     dirección asignada manualmente.  Este es el comportamiento por
     defecto si no se especifica nada.

-4
:    Generar una dirección IPv4

-6
:    Generar una dirección IPv6.  Este es el comportamiento por defecto.


# DESCRIPCION

Agrega o genera una dirección IP en el archivo de host del nodo
especificado.  Puede ser IPv4 (con _-4_) o IPv6 (con _-6_).

Útil para la migración a IPv6.

Este comando adivina el nombre del nodo a partir de $HOSTNAME si no se
pasa como argumento.


# EJEMPLOS

## Generar y agregar una IPv6 al nodo local

_lvpn add-subnet_ -v
