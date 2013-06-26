# Actualizar los archivos base

El "skel" de tinc incluye los scripts que inician y configuran la red (tinc-up,
tinc-down, etc.).  Este comando actualiza esos scripts en los nodos
especificados.

Si los archivos ya existen se guardan backups.

Uso:
  lvpn update-skel [-v] nodo1 [nodo2 ...]
