% LVPN-CREATE-KEYNODE(1) LibreVPN Manual | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2015

# NOMBRE

lvpn create-keynode crea un nodo llavero


# SINOPSIS

lvpn create-keynode [-h] [-p puerto] [-c hosts.git] [-k lvpn-keynode] nodo-local


# DESCRIPCION

Configura e inicia un nodo llavero.  El llavero es un repositorio git(1)
con los archivos de nodo que permite a cualquiera en la VPN a tomar y
publicar cambios.

El llavero es un servidor sshd(8) corriendo en un puerto especial que
permite conexiones no autenticadas desde la VPN.  De esta forma los
cambios solo pueden provenir de la red misma.

Este programa configura una chroot ssh para el usuario lvpn-keynode y
solo permite git pull y push via git-shell(1).  Al ejecutarlo repetidas
veces se reparán la chroot y el archivo de configuración de sshd
(alternativo al del sistema), además de reiniciar sshd si es necesario.


# OPCIONES

-h
:    Este mensaje

-p port
:    Puerto alternativo.  El default es 490001.

-c
:    Clona hosts.git desde esta URL git.

-k lvpn-keynode
:    Usuario para el llavero. El default es lvpn-keynode.


# EJEMPLOS

## Configura e inicia el llavero de ponape

_lvpn create-keynode_ ponape

## Reinicia el llavero de ponape

_lvpn create-keynode_ ponape


# VEASE TAMBIEN

_sshd(8)_ _git-shell(1)_
