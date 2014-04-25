# LibreVPN

> http://librevpn.org.ar

LibreVPN es una red libre virtual.

Estos son los scripts de configuración y administración de la VPN y aplican
muchas de las acciones comunes sobre tinc.

Para obtener ayuda, ejecutar `lvpn -h`.  Cada comando tiene su -h tambien.

## Crear un nodo

    lvpn init -h

## Dónde está la configuración de mi nodo?

En el directorio `nodos/`, esto permite mantener la configuración de
varios nodos en una sola máquina, intercambiarlos o copiarlos a otras
máquinas.

Por cada cambio en la configuración tenés que usar `lvpn install` o
`lvpn push` (dependiendo si es un nodo local o remoto).

## El nombre de mi nodo está lleno de guiones bajos y/o es feo

Si no le diste un nombre a tu nodo, `lvpn` va a usar el nombre de tu
máquina.  Si cuando instalaste tu distro dejaste que el instalador elija
por su cuenta, vas a tener un nombre de nodo lleno de guiones bajos en
lugar de los caracteres que tinc no acepta (por ejemplo, "-" se
convierte en "\_") y además el modelo de tu computadora.

Si querés cambiar esto lo mejor es cambiando el hostname de tu
computadora, siguiendo los pasos que indique tu distro.  Sino, agregá un
nombre al comando `lvpn init un_nombre_lindo`.

## Cómo me conecto con otro nodo?

Enviá tu archivo de nodo a la lista vpn@hackcoop.com.ar o dáselo a
alguien que ya esté dentro de la red.

Luego, conectate a ese nodo con:

    lvpn connectto tu_nodo el_otro_nodo
    lvpn install tu_nodo

## Lo puedo usar en Android?

Sí!  Instalá Tinc for Android desde [F-Droid](https://f-droid.org) y
crea un nodo con `lvpn init -A`.

## Requisitos

tinc (1 o 1.1), avahi-daemon, bash.

Además los scripts informan sobre otros comandos que pueden llegar a
necesitar.

## Instalación en el sistema

    sudo make install PREFIX=/usr


## Desarrolladoras

Ver _doc/CONVENCIONES.markdown_.

## Wiki

http://wiki.hackcoop.com.ar/Categoría:LibreVPN
