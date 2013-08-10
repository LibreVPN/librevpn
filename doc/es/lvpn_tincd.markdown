% LVPN\_TINCD(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

LibreVPN

# OPCIONES

Las flags recomendadas para correr _tincd_ son:

### Seguridad

-U nobody
:    No correr con privilegios de root

-R
:    Chroot al directorio de configuración

-L
:    Poner tincd en memoria protegida.  Esta opción protege mejor los
     parámetros de cifrado pero en mi experiencia hace que _tincd_ se
     cierre inesperadamente.  Usar con precaución.


### Log

--logfile
:    Crea /var/log/tinc.vpn.log

-d 1
:    Informa las conexiones


# VER TAMBIEN

_tincd(8)_
