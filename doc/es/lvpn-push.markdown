% LVPN-PUSH(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Sincronizar un nodo en otro sistema


# SINOPSIS

_lvpn push_ nodo user@host [directorio de tinc]


# DESCRIPCION

Este comando permite instalar o actualizar un nodo en otro sistema. Está
pensado para poder trabajar con nodos embebidos, como los instalados en
routers con OpenWRT.

Necesita acceso SSH.


# EJEMPLOS

## Sincronizar un nodo

_lvpn push_ guachiguau root@10.4.23.225
