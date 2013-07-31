% LVPN-CONNECTTO(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Agregar otros nodos a los que conectarse


# SINOPSIS

_lvpn connectto_ nodo-local [nodo-remoto nodo-remoto2...]


# DESCRIPCION

Configura el nodo local para conectarse a los nodos remotos
especificados.  Para poder ingresar a una red tinc, hay que copiar el
archivo de host del nodo remoto en el directorio hosts/ y agregar la
línea _ConnectTo = nodo-remoto_ en _tinc.conf_.  Este script automatiza
este paso.

Los nodos remotos deben ejecutar el comando _lvpn add-host_ con el
nombre del nodo local.


# EJEMPLOS

## Listar los nodos a los que noanoa se conecta

    lvpn connectto noanoa

## Agregar los nodos ponape y medieval al nodo noanoa

    lvpn connectto noanoa ponape medieval


# VER TAMBIEN

_tinc.conf(5)_, _lvpn-add-host(1)_
