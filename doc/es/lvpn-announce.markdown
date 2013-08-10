% LVPN-ANNOUNCE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

_lvpn announce_ Anunciar la llave en la red local usando avahi.


# SINOPSIS

_lvpn announce_ [-h] [-sp] nodo-local


# DESCRIPCION

Facilita el intercambio de llaves en una red local anunciando el host
local en mDNS.  Usar en conjunto con _lvpn discover_.


# OPCIONES

-h
:    Ayuda

-s
:    Dejar de anunciar, junto con _-p_ elimina el archivo
     _lvpn.service_, sino, detiene _avahi-publish_.

-p
:    Anunciar permanentemente (requiere root).  Instala _lvpn.service_
     de forma que _avahi-daemon_ anuncie la llave cada vez que se inicia
     el servicio.

# EJEMPLOS

## Anunciar un nodo

  lvpn announce noanoa


## Anunciar un nodo permanentemente

  lvpn announce -p noanoa

Instala el host _noanoa_ en /etc/avahi/services/lvpn.service.


## Anuncia una llaves tipo conserje (?)

  lvpn announce -b amigo


## Dejar de anunciar un nodo

  lvpn announce -s

Detiene _avahi-publish_ para esta sesión.


## Dejar de anunciar un nodo permanente

  lvpn announce -sp


# VER TAMBIEN

_avahi.service(5)_, _avahi-publish(1)_, _lvpn-discover(1)_
