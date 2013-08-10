% LVPN-UPDATE-SKEL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Actualizar los archivos base.


# SINOPSIS

_lvpn update-skel_ [-v] nodo1 [nodo2 ...]


# OPCIONES

-v
:    Modo verborrágico


# DESCRIPCION

El "skel" de _lvpn_ incluye los scripts que inician y configuran la red
(_tinc-up_, _tinc-down_, etc.).  Este comando actualiza esos scripts en
los nodos especificados.

Si los archivos ya existen se guardan backups con la extensión
_.backup_.

