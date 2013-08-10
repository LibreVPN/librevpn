% LVPN-ADD-HOST(1) Manual de LibreVPN | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

lvpn add-host agrega un nodo a los nodos conocidos


# SINOPSIS

lvpn add-host [-hfu] nodo-local nodo-remoto1 [nodo-remoto2 ...]


# DESCRIPCION

Para que un nodo pueda conectarse a otro, el segundo nodo debe
"reconocerlo" agregando su archivo de host.

Por ejemplo, si el nodo _ponape_ posee en tu archivo _tinc.conf_ el
comando "ConnectTo = medieval", para que _medieval_ lo reconozca, debe
agregar el archivo de _ponape_ en su directorio de nodos.

Con el flag `-u` se actualizan los hosts ya agregados.


# OPCIONES

-h
:    Este mensaje

-u
:    Actualizar los hosts

-f
:    Reemplazar el host si ya existe, forzar


# EJEMPLOS

## Agregar los nodos haiti y noanoa a ponape

_lvpn add-host_ ponape haiti noanoa


## Actualizar los nodos

_lvpn add-host_ -u ponape
