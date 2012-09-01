# Agrega un nodo a los nodos conocidos

Para que un nodo pueda conectarse a otro, el segundo nodo debe "reconocerlo"
agregando su archivo de host.

Por ejemplo, si el nodo _ponape_ posee en tu archivo _tinc.conf_ el comando
"ConnectTo = medieval", para que _medieval_ lo reconozca, debe agregar el
archivo de _ponape_ en su directorio de nodos.

Uso:
    lvpn add-host [-h] nodo-local nodo-remoto1 [nodo-remoto2 ...]
