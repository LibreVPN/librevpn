# lvpn-discover

Descubrir nodos en la red local usando Avahi y opcionalmente agregarlos.

Por seguridad, si el archivo del nodo ya existe localmente, se utiliza ese.
Con la opción `-f` se confía en todos.

  -h Este mensaje
  -i Filtrar por interface
  -a Agregar los nodos (reconocerlos)
  -c Conectarse a los nodos (implica -a)
  -f Confiar en las llaves de la red en lugar de las locales
  -A Usar todas las interfaces (incluso la de la VPN, ¡no usar con -c!)

Uso:

* Listar los nodos encontrados en la LAN

  lvpn discover

* Encontrar todos los nodos anunciados, incluida la VPN

  lvpn discover -A

* Agregar los nodos encontrados a ponape

  lvpn discover -a ponape

* Conectarse a los nodos encontrados por ponape

  lvpn discover -c ponape

* La red local es de confianza

  lvpn discover -f -c ponape

* Si estamos conectados a varias redes, sólo buscar en una:

  lvpn discover -i eth0 -c ponape

* Conectarse a todos los nodos anunciados, incluida la VPN (¡nunca hacer esto!)

  lvpn discover -c ponape -A

