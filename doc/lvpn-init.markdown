# Crea un nuevo nodo

Los nodos se guardan en el directorio $LVPN\_DIR/nodos/ 

Uso: 
lvpn init [-f] [-v] [-p 655] [-l 192.168.9.202/32] [-s subred] [-r] [-h dominio.eninternet.tld] [-c otronodo] nodo 

Ejemplos:
* Uso básico con una sola conexión

  lvpn init -i -c trululu guachiguau
 
* Crear un nodo publico con una conexion e instalarlo localmente

  lvpn init -i -h guachiguau.org -c trululu guachiguau

* Crear un nodo con una IP predeterminada en la red 

  lvpn init -l 192.168.9.202/32 guachiguau

* Crear un nodo que acepte otras redes 

  lvpn init -r guachiguau

* Crear un nodo que acepte otras redes y sea puente de otra red

  lvpn init -r -s 10.4.23.224/27 guachiguau"

