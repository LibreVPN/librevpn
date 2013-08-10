% LVPN-SEND-EMAIL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Envía un nodo por correo

-h
:    Ayuda

-t
:    Destinatario, por defecto es la lista vpn@hackcoop.com.ar

-f
:    Remitente, por defecto email de git o usuario@hostname

-s
:    Asunto alternativo

-m
:    Mensaje alternativo


## Variables de entorno:

SENDMAIL
:    Programa alternativo a sendmail


# DESCRIPCION

Genera un email con el archivo de host del nodo especificado y lo envía
al destinatario.

Necesita la utilidad _sendmail_ o compatible configurada en el sistema.


# VER TAMBIEN

_sendmail(1)_
