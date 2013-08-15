% CONVENCIONES(2) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Notas para desarrolladores de lvpn :)


# SYNOPSIS

lib/
:    comandos

lib/skel/
:    archivos base para tinc

doc/
:    documentación

bin/
:    programas de ayuda que no son especificamente de lvpn

etc/
:    código fuente extra

hosts/
:    archivos de nodos

nodos/
:    nodos propios

locale/
:    traducciones


# DESCRIPTION

## Dónde van los scripts

El script _lvpn_ autodescubre los comandos siguiendo la convención
_lib/lvpn-tuscript_.  Además setea algunas variables de entorno que los
scripts pueden usar para saber en qué red están trabajando.

Los scripts pueden estar en cualquier lenguaje de programación mientras
sepan leer esas variables de entorno.


## Variables de entorno

Estas son las variables de entorno que _lvpn_ exporta para el resto de los
comandos.

TINC
:    Ubicación del directorio del nodo, por defecto _/etc/tinc/lvpn_.

NETWORK
:    Nombre de la red, por defecto el último directorio de _TINC_.

LVPN
:    Path completo de _lvpn_.

LVPN\_DIR
:    Path completo del directorio de trabajo, por defecto el directorio
     base de _LVPN_

LVPN\_LIBDIR
:    Path completo del directorio de comandos.

LVPN\_HOSTS
:    Path completo del directorio de hosts.

LVPN\_BEADLE
:    Path completo del directorio de llaves anunciables nuevas de desconocidos.

KEYSIZE
:    Tamaño por defecto de las llaves.

LVPN\_SUBNET
:    El rango de IPv4

LVPN\_SUBNET6
:    El rango de IPv6

TINCD\_FLAGS
:    Flags para el demonio _tincd_.

PORT
:    Puerto por defecto

sudo
:    Usar esta variable delante de cualquier comando que deba correr con
     privilegios de root, ej: _${sudo} rsync_.  Requiere _"root=true"_ al
     principio del script.


## Dónde va la documentación

La documentación lleva el nombre completo del script:
_doc/idioma/lvpn-tuscript.markdown_.  La función _help()_ en _lib/msg_
lo lleva como argumento para mostrar la ayuda.

Además, toma la variable de entorno _PAGER_ para paginar la salida, por
defecto se usa _less_.


## Flags y parámetros

_lvpn comando_ -flags nodolocal parametros extra

Seguido de _lvpn_ viene el comando, al que se le pasan en orden las flags (con
sus opciones).  El primer parámetro siempre tiene que ser el nodo local en el
que se realiza la acción.  Luego vienen los parámetros extra (nombres de otros
nodos, por ejemplo).

## Funciones comunes

En el archivo _lib/common_ se almacenan las funciones de uso común entre todos
los comandos.  Se la puede incluir en un script añadiendo la línea

    . "${LVPN_LIBDIR}"/common

al principio del script.

Nota: Agregar _root=true_ antes de common para poder correr funciones de
root.

### Variables

* self: nombre del script. Usado para obtener el nombre del script. Ejemplo:
  _help $self_ llama a la ayuda del script actual.

### Funciones

* _add_to_file()_: Agrega una línea al final de un archivo. Uso: _add_to_file
  archivo "Texto a agregar"_

* _requires()_: Indica que el script necesita que un programa se encuentre en el
  PATH.  Se recomienda cuando el script llama a un programa que puede no
  encontrarse en una instalación estándar.  Uso: _requires avahi-publish rsync_

* _get\_node\_dir()_: Encuentra el directorio de un nodo pasándole el nombre del
  nodo como argumento.  _node_dir="$(get_node_dir ${node})"_

* _get\_node\_file()_: Encuentra el archivo de host de un nodo dentro del
  directorio del nodo.  _node_file="$(get_node_file ${node})"_

* _get\_node\_name()_: Limpia el nombre del nodo de caracteres inválidos

* _get\_host\_file()_: Obtiene el archivo del nodo en $LVPN\_HOSTS

* _find\_init\_system()_: Encuentra el tipo de inicio de tinc.  Ver
  _lib/lvpn-install_.

* _get\_id()_: Obtiene nombre y mail del responsable del nodo usando git o
  usuario@hostname.

* _get\_ipv4()_: Genera una dirección IPv4 a partir de LVPN_SUBNET.

* _get\_ipv6()_: Genera una dirección IPv6 a partir de LVPN_SUBNET6.


## Mensajes

En _lib/msg_ se encuentran las funciones básicas para imprimir mensajes en la
salida de errores estándar.  Esto es para que no sean procesados como la salida
estándar de los scripts, que se reservan para poder enviar la información a una
tubería.

No es necesario incluirla ya que se llama desde _lib/common_.

Todas las funciones tienen soporte para traducciones utilizando gettext, por lo
que los mensajes que se completan con variables deben seguir el formato de
_printf_: _%s_ para reemplazar por cadenas, _%d_ para números enteros, etc.

Por ejemplo: _msg "Procesando el nodo %s..." "$node"_

* _msg()_: Información
* _error()_: Mensaje de error
* _warning()_: Alerta
* _fatal\_error()_: Imprime un mensaje de error y termina el programa
  inmediatamente
* _tip()_: Recomendaciones, por ejemplo, cual comando correr a continuación.


## Los comandos

La mayoria de los comandos solo configuran, luego hay que enviar los cambios a
directorio de instalación con el comando _lvpn init install_.
