% LVPN-DISCOVER(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NOMBRE

Descubrir nodos en la red local usando Avahi y opcionalmente agregarlos.


# SINOPSIS

_lvpn discover_ [-h] [-i if|-A] [-a|-c] [-f] [-b] nodo-local [nodo-remoto]


# OPCIONES

-h
:    Ayuda

-i
:    Filtrar por interface de red

-a
:    Agregar los nodos, reconocerlos.  Descarga el archivo de host del
     nodo y lo agrega usando _lvpn add-host_.

-c
:    Conectarse a los nodos (implica -a).  Luego de correr _-a_, se
     conecta a los nodos como si se corriera _lvpn connectto_.

-f
:    Confiar en las llaves de la red en lugar de las locales.  Cuando ya
     se posee una copia del archivo de host, se utiliza esa copia.  Con
     esta opción siempre se usa el host anunciado.

-A
:    Usar todas las interfaces (incluso la de la VPN, ¡no usar con _-c_!)

-b
:    Agrega una llave anunciada en la LibreVPN (?)


# DESCRIPCION

Facilita el intercambio de archivos de nodo en una red local.

Usado en conjunto con _lvpn announce_ para descubrir nodos anunciados en
la red local de esta forma.

Por seguridad, si el archivo del nodo ya existe localmente, se utiliza ese.
Con la opción _-f_ se confía en todos.


# EJEMPLOS

## Listar los nodos encontrados en la LAN

lvpn discover

## Encontrar todos los nodos anunciados, incluida la VPN

  lvpn discover -A

## Agregar los nodos encontrados a ponape

  lvpn discover -a ponape

## Conectarse a los nodos encontrados por ponape

  lvpn discover -c ponape

## La red local es de confianza

  lvpn discover -f -c ponape

## Si estamos conectados a varias redes, sólo buscar en una:

  lvpn discover -i eth0 -c ponape

## Conectarse a todos los nodos anunciados, incluida la VPN (¡nunca hacer esto!)

  lvpn discover -c ponape -A

## Conecta a una llave anunciada en la VPN

  lvpn discover -b ponape nuevo-nodo
