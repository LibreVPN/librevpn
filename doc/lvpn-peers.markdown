# Lista los pares desconocidos

Busca los nodos que intentan conectarse con el nodo local pero son rechazados
porque la llave no está accesible.

El demonio tincd debe iniciarse con la opción --logfile.

    -h  Esta ayuda
    -c  Contar los intentos de conexion

Uso:
    lvpn peers [/var/log/tinc.lvpn.log]
