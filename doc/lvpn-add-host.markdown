# Agrega un nodo a los nodos conocidos

Para que un nodo pueda conectarse a otro, el segundo nodo debe "reconocerlo"
agregando su archivo de host.

Por ejemplo, si el nodo _ponape_ posee en tu archivo _tinc.conf_ el comando
"ConnectTo = medieval", para que _medieval_ lo reconozca, debe agregar el
archivo de _ponape_ en su directorio de nodos.

Con el flag `-u` se actualizan los hosts ya agregados.

  -h Este mensaje
  -u Actualizar los hosts
  -f Reemplazar el host si ya existe

Uso:
    lvpn add-host [-hfu] nodo-local nodo-remoto1 [nodo-remoto2 ...]

* Agregar los nodos haiti y noanoa a ponape

  lvpn add-host ponape haiti noanoa

* Actualizar los nodos

  lvpn add-host -u ponape
