# Crea un nuevo nodo

Los nodos se guardan en el directorio nodos/ 

    -h  Esta ayuda
    -v  Modo verborrágico
    -i  Instalar al finalizar (requiere root)
    -f  Forzar la creación de un nodo
    -p  Número de puerto (655)
    -l  IP en la VPN (se adivina)
    -s  Anunciar otra subred
    -r  Aceptar otras subredes remotas
    -a  Ubicación pública del nodo (dominio o IP)
    -c  Conectar a este nodo

Uso: 
lvpn init [-f] [-v] [-p 655] [-l 192.168.9.202/32] [-s 10.4.24.128/27] [-r] [-a dominio.eninternet.tld] [-c otronodo] nodo 

Ejemplos:
* Uso básico con una sola conexión

  lvpn init -c trululu guachiguau
 
* Crear un nodo publico con una conexion e instalarlo localmente

  lvpn init -i -a guachiguau.org -c trululu guachiguau

* Crear un nodo con una IP predeterminada en la red 

  lvpn init -l 192.168.9.202/32 guachiguau

* Crear un nodo que acepte otras redes 

  lvpn init -r guachiguau

* Crear un nodo que acepte otras redes y sea puente de otra red

  lvpn init -r -s 10.4.23.224/27 guachiguau

