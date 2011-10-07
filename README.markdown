# Lab VPN
Poner estos archivos dentro de /etc/tinc

## Crear un nodo

Correr `./configure nodo dominio` o:

Editar el archivo lab/tinc.conf cambiando el valor de Name al nombre de tu
nodo.

Crear el archivo lab/hosts/NodoTuyo con una dirección IP pública o dominio que
apunten a tu nodo en el valor de Address y poner la id de tu nodo en Subnet.

    echo "Address = tunodo.org" >> lab/hosts/TuNodo
    echo "Subnet = 192.168.9.ID/32" >> lab/hosts/TuNodo

Generar las llaves:

    tincd -n lab --generate-keys=4096

> NUNCA publicar la llave privada (rsa\_key.priv)

Editar lab/tinc-up cambiando la "x" por la id de tu nodo.

Iniciar el demonio tincd. A mano:

    tincd -n lab


## TODO
* Usar alguno de los scripts de inicio para levantar dominios de la vpn, por
  ejemplo tunodo.lab, minodo.lab, apuntando a las subnets elegidas.
