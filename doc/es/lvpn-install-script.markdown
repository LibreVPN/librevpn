% LVPN-INSTALL-SCRIPT(1) Manual de LibreVPN | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

lvpn install-script instala script que se ejecutan en eventos de la VPN.


# SINOPSIS

lvpn install-script [-hves] nodo-local evento script


# DESCRIPCION

Instala scripts que se ejecutan durante eventos de la VPN.  Al momento
`tincd` sólo soporta dos tipos de eventos, cuando un nodo se conecta o
desconecta, o cuando una subred es anunciada o desanunciada.


# OPCIONES

-h
:    Este mensaje

-v
:    Modo verborrágico

-e
:    Listar los eventos disponibles

-s
:    Listar los scripts disponibles


# EJEMPLOS

## Mostrar una notificación cuando un nodo se (des)conecta

_lvpn install-script_ ponape host notify
