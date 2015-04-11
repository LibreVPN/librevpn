% LVPN-ROTATE-NODES(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NOMBRE

Rota las conexiones a la VPN del nodo local


# SINOPSIS

_lvpn rotate-nodes_ [-hk] [-n N] nodo-local


# OPCIONES

-h
:    Este mensaje

-n N
:    Conecta a **N** nodes.  Por defecto a **3**.

-k
:    Solo se conecta a nodos que conocen a **nodo-local**.


# DESCRIPCION

Configura **nodo-local** para conectarse a un grupo de nodos aleatorios.

Prueba la conexión a nodos aleatorios y configura **nodo-local** para
que se conecte a ellos.

Este programa te ayuda a obtener un grupo de conexiones a la VPN.

Cuando se usa la opción **-k**, solo se harán conexiones a nodos que
conozcan a **nodo-local**.  No hagas esto si recién entrás a la VPN.
Ver _lvpn-test-node(1)_ para más información.


# EJEMPLOS

## Conecta yap a nodos al azar

lvpn rotate-nodes yap

## Conecta yap a diez nodos al azar

lvpn rotate-nodes -n 10 yap

## Conecta yap a los nodos que lo conocen

lvpn rotate-nodes -k yap


# VEASE TAMBIEN

 _lvpn-create-keynode(1)_ _lvpn-test-node(1)_ _lvpn-add-keynode(1)
