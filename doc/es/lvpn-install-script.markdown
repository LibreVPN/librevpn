% LVPN-INSTALL-SCRIPT(1) Manual de LibreVPN | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

lvpn install-script instala script que se ejecutan en eventos de la VPN.


# SINOPSIS

lvpn install-script [-hves] nodo-local evento script


# DESCRIPCION

Instala scripts que se ejecutan durante eventos de la VPN.  Al momento
`tincd` sólo soporta dos tipos de eventos luego de iniciado, cuando
un nodo se conecta o desconecta, o cuando una subred es anunciada o
desanunciada.


# OPCIONES

-h
:    Este mensaje

-v
:    Modo verborrágico

-e
:    Listar los eventos disponibles

-s
:    Listar los scripts disponibles


# EVENTOS

tinc
:    Este evento se ejecuta cuando se inicia o se detiene la VPN.
     Colocar scripts que sólo deben ejecutarse una vez acá.

host
:    Ejecutar este script cada vez que un nodo aparece o desaparece.

subnet
:    Ejecutar este script cada vez que una subred aparece o desaparece.


# SCRIPTS

debug
:    Útil para debuguear eventos

notify
:    Muestra una notificación cada vez que un nodo se conecta o
     desconecta, usando libnotify. **No funciona**, D-Bus no permite que
     un usuario mande notificaciones a la sesión de otro.

ipv6-router
:    Configura este nodo como un router/gateway de IPv6

ipv6-default-route
:    Configura la ruta IPv6 por defecto para este nodo


# EJEMPLOS

## Mostrar una notificación cuando un nodo se (des)conecta

_lvpn install-script_ ponape host notify


# VER TAMBIEN

_tinc.conf(5)_
