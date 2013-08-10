% LVPN-INSTALL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Instala o sincroniza el nodo en el sistema.


# SINOPSIS

_lvpn install_ [-hvdn] nodo-local


# OPCIONES

-h
:    Esta ayuda

-v
:    Modo verborrágico

-d
:    Eliminar archivos extra, copiar tal cual se ve en nodos/nodo-local

-n
:    Mostrar los cambios sin realizarlos (usar con -v)


# DESCRIPCION

Sincroniza _nodos/nodo-local_ con _/etc/tinc/lvpn_.

Es necesario correrlo luego de cada cambio.

Además, configura el sistema para el inicio automático de la VPN y si
se usa NetworkManager, la reconexión inmediata al conectarse a una red.

Si el paquete que provee _nss-mdns_ se encuentra instalado, modificar el
archivo _/etc/nsswitch.conf_ para resolver direcciones _hostname.local_.


# VER TAMBIEN

_rsync(1)_
