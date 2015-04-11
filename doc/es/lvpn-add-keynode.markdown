% LVPN-ADD-KEYNODE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NOMBRE

Agrega nodos llavero a un nodo


# SINOPSIS

_lvpn add-keynode_ [-h] [-l] nodo-local llavero:hosts.git [llavero:hosts.git]


# OPCIONES

-h
:    Este mensaje

-l
:    Lista los llaveros de este nodo


# DESCRIPCION

Configura nodo-local para obtener archivos de nodo de las URLs
especificadas.

Convierte el directorio de nodos de nodo-local en un repositorio git que
toma y publica cambios en los repositorios especificados.


# VEASE TAMBIEN

_git(1)_ _lvpn-create-keynode(1)_
