% LVPN-INIT(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Crea un nuevo nodo


# SINOPSIS

lvpn init [-A] [-f] [-q] [-p 655] [-l 192.168.9.202/32] [-s 10.4.24.128/27] [-r] [-a dominio.eninternet.tld] [-c otronodo] nodo


# OPCIONES

-h
:    Ayuda

-q
:    Modo silencioso

-a ejemplo.org
:    Ubicación pública del nodo (dominio o IP).  Puede especificarse
     varias veces en el orden en que se quiera que los demás nodos
     intenten conectarse.  Si no se especifica esta opción se entiende
     que el nodo no es accesible públicamente y no acepta conexiones
     (sólo cliente).

-c nodo-remoto
:    Conectar a este nodo.  Versión rápida de _lvpn connectto_.  Puede
     especificarse varias veces.

-l 192.168.9.0
:    Usar esta dirección IP.  Si no se especifica, la dirección es
     generada automáticamente.

-i
:    Instalar al finalizar (requiere root).  Es lo mismo que correr
     _lvpn install_ más tarde.

-f
:    Forzar la creación de un nodo.  Útil si se canceló previamente o se
     quiere comenzar desde cero.  Se pierden todos los datos!

-p 655
:    Número de puerto, por defecto 655 o la variable de entorno
     _LVPN\_PORT_.

-s 10.0.0.0
:    Anunciar otra subred (_opción no funcional_).

-r
:    Aceptar otras subredes remotas (_opción no funcional_).

-A
:    Crear un nodo para sistemas Android.  Dado que el sistema puede no
     contener utilidades avanzadas de configuración, esta opción instala
     una versión mínima de _tinc-up_.


# DESCRIPCION

Genera la configuración básica de un nodo y lo almacena en el directorio
_nodos/nombre-del-nodo_.

Se puede correr varias veces con diferentes nombres de nodo para tener
configuraciones separadas (un sólo host, varios nodos) o unidas (un nodo
para cada host local o remoto).

Por ejemplo, los dispositivos embebidos pueden no soportar las
herramientas de _lvpn_, pero desde un sistema GNU/Linux se puede generar
la configuración y luego copiarla al host que corresponda (al celular o
tablet Android, router con OpenWrt, etc.)

_IMPORTANTE_: La configuración por defecto de un nodo permite el
descubrimiento de pares en la red local y las conexiones indirectas.
Esto quiere decir que si no querés permitir las conexiones de nodos que
no hayas explicitado en tu configuración, vas a tener que cambiar esas
variables a "no" y además agregar "DirectOnly = yes" al archivo
_tinc.conf_.


# EJEMPLOS

## Uso básico con una sola conexión

  lvpn init -c trululu guachiguau

## Crear un nodo público con una conexión e instalarlo localmente

  lvpn init -i -a guachiguau.org -c trululu guachiguau

## Crear un nodo con una IP predeterminada en la red 

  lvpn init -l 192.168.9.202/32 guachiguau

## Crear un nodo que acepte otras redes 

  lvpn init -r guachiguau

## Crear un nodo que acepte otras redes y sea puente de otra red

  lvpn init -r -s 10.4.23.224/27 guachiguau

## Crear el nodo rapanui para sistemas android

Necesita [Tinc GUI for Android](http://tinc_gui.poirsouille.org/)

  lvpn init -A -c ponape rapanui
