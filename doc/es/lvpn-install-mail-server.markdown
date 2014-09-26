% LVPN-INSTALL-MAIL-SERVER(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

_lvpn install-mail-server_ instala un servidor de correo local para
intercambio de correo electrónico de nodo a nodo.


# SINOPSIS

_lvpn install-mail-server_ [-h] [-f] [-p /etc/postfix] nodo-local


# DESCRIPCION

Instala una configuración de _postfix_ orientada a intercambiar correo
electrónico entre nodos usando direcciones locales con la forma
_usuario@nodo.local_.  Además puede enviar correo hacia Internet usando
un gateway SMTP que traduce las direcciones.


# OPCIONES

-h
:    Este mensaje

-f
:    Forzar la instalación, eliminando la configuración de postfix
     existente

-p /etc/postfix
:    Instala la configuración en otra ruta.


# VER TAMBIEN

_postfix(1)_ _postmap(1)_ _transport(5)_
