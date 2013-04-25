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
_doc/lvpn-tuscript.markdown_.  La función _help()_ en _lib/msg_ lo lleva
como argumento para mostrar la ayuda.

Además, toma la variable de entorno _PAGER_ para paginar la salida, por defecto
se usa _less_.


## Flags y parámetros

> lvpn comando -flags nodolocal parametros extra

Seguido de `lvpn` viene el comando, al que se le pasan en orden las flags (con
sus opciones).  El primer parámetro siempre tiene que ser el nodo local en el
que se realiza la acción.  Luego vienen los parámetros extra (nombres de otros
nodos, por ejemplo).

## Funciones comunes

En el archivo _lib/common_ se almacenan las funciones de uso común entre todos
los comandos.  Se la puede incluir en un script añadiendo la línea 

    . "${LVPN_LIBDIR}"/common

al principio del script.

### Variables

* self: nombre del script. Usado para obtener el nombre del script. Ejemplo:
  `help $self` llama a la ayuda del script actual.

### Funciones

* add_to_file(): Agrega una línea al final de un archivo. Uso: `add_to_file
  archivo "Texto a agregar"`

* requires(): Indica que el script necesita que un programa se encuentre en el
  PATH.  Se recomienda cuando el script llama a un programa que puede no
  encontrarse en una instalación estándar.  Uso: `requires avahi-publish rsync`

* get_node_dir(): Encuentra el directorio de un nodo pasándole el nombre del
  nodo como argumento.  `node_dir="$(get_node_dir ${node})"`

* get_node_file(): Encuentra el archivo de host de un nodo dentro del
  directorio del nodo.  `node_file="$(get_node_file ${node})"`

* get_node_name(): Limpia el nombre del nodo de caracteres inválidos

* find_init_system(): Encuentra el tipo de inicio de tinc.  Ver
  _lib/lvpn-install_.


## Mensajes

En _lib/msg_ se encuentran las funciones básicas para imprimir mensajes en la
salida de errores estándar.  Esto es para que no sean procesados como la salida
estándar de los scripts, que se reservan para poder enviar la información a una
tubería.

No es necesario incluirla ya que se llama desde _lib/common_.

Todas las funciones tienen soporte para traducciones utilizando gettext, por lo
que los mensajes que se completan con variables deben seguir el formato de
_printf_: _%s_ para reemplazar por cadenas, _%d_ para números enteros, etc.

Por ejemplo: `msg "Procesando el nodo %s..." "$node"`

* _msg()_: Información
* _error()_: Mensaje de error
* _warning()_: Alerta
* fatal\_error(): Imprime un mensaje de error y termina el programa
  inmediatamente

## Los comandos

La mayoria de los comandos solo configuran, luego hay que enviar los cambios a
directorio de instalación con el comando `lvpn init install`
