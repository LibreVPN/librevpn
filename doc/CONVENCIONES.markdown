# Convenciones de lvpn

Notas para desarrolladores de lvpn :)

## Árbol

  lib/      # comandos
  lib/skel/ # archivos base para tinc
  doc/      # documentación
  bin/      # programas de ayuda que no son especificamente de lvpn
  etc/      # código fuente extra
  hosts/    # archivos de nodos
  nodos/    # nodos propios
  locale/   # traducciones


## Dónde van los scripts

El script `lvpn` autodescubre los comandos siguiendo la convención
_lib/lvpn-tuscript_.  Además setea algunas variables de entorno que los scripts
pueden usar para saber en qué red están trabajando.

Los scripts pueden estar en cualquier lenguaje de programación mientras sepan
leer esas variables de entorno.

## Variables de entorno

Estas son las variables de entorno que `lvpn` exporta para el resto de los
comandos.

* TINC: Ubicación del directorio del nodo, por defecto _/etc/tinc/lvpn_.

* NETWORK: Nombre de la red, por defecto el último directorio de _TINC_.

* LVPN: Path completo de `lvpn`.

* LVPN\_DIR: Path completo del directorio de trabajo, por defecto el directorio
  base de _LVPN_

* LVPN\_LIBDIR: Path completo del directorio de comandos.

* LVPN\_HOSTS: Path completo del directorio de hosts.

* LVPN\_BEADLE: Path completo del directorio de llaves anunciables nuevas de desconocidos.

* KEYSIZE: Tamaño por defecto de las llaves.

* LVPN\_SUBNET: El rango de IPv4

* LVPN\_SUBNET6: El rango de IPv6


## Dónde va la documentación

La documentación lleva el nombre completo del script:
_doc/lvpn-tuscript.markdown_.  La función _help()_ en _lib/common_ lo lleva
como argumento para mostrar la ayuda.

Además, toma la variable de entorno _PAGER_ para paginar la salida, por defecto
se usa _less_.
