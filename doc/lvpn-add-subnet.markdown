# Agregar una dirección IP al nodo

Agrega o genera una dirección IP en el archivo de host del nodo especificado.
Puede ser IPv4 (con -4) o IPv6 (con -6).

Útil para la migración a IPv6.

Este comando adivina el nombre del nodo a partir de $HOSTNAME si no se pasa
como argumento.

    -h Este mensaje
    -v Modo verborrágico
    -g Generar la dirección IP
    -4 Generar una dirección IPv4
    -6 Generar una dirección IPv6

## Uso

    lvpn add-subnet [-hvg] -[4|6] [nodo] [dirección]

## Ejemplos

* Generar y agregar una IPv6 al nodo local

  lvpn add-subnet -v
