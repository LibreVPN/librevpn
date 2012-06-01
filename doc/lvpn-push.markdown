# Sincronizar un nodo en otro sistema

Este comando permite instalar o actualizar un nodo en otro sistema. Está
pensado para poder trabajar con nodos embebidos, como los instalados en routers
con OpenWRT.

Necesita acceso SSH.

Uso:
lvpn push nodo user@host [directorio de tinc]

Ejemplos:

* Sincronizar un nodo
  lvpn push guachiguau root@10.4.23.225
