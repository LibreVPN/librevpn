% LVPN-INIT(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Creates a new node


# SYNOPSIS

lvpn init [-A] [-f] [-q] [-p 655] [-l 192.168.9.202/32] [-s 10.4.24.128/27] [-r] [-a internet.domain.tld] [-c otronodo] nodo


# OPTIONS

-h
:    This message

-q
:    Silent mode

-a example.org
:     Public address of the node (domain or IP).  It can be specified
      multiple times, so tinc tries these addresses in the given order.
      If not provided, the node isn't publicly accesible and doesn't
      accept connections (it's only a client).

-c remote-node
:    Connect to this node.  Fast version of _lvpn connectto_.  Can be
     provided multiple times.

-l 192.168.9.0
:    Use this IP address.  If not provided, an address is automatically
     generated.

-i
:    Install when done (requires root).  It's the same as _lvpn install_
     afterwards.

-f
:    Force creation.  Use when a previous attempt was cancelled or you
     need to start over.  All data is lost!

-p 655
:    Port number, default is 655 o *LVPN_PORT* env var.

-s 10.0.0.0
:    Announce another subnet (deprecated)

-r
:   Accept other subnets (deprecated)

-A
:    Creates a node for Android.  Since the system doesn't have advanced
     configuration utilities, this option provides a stripped down
     version of _tinc-up_.


# DESCRIPTION

Generates the basic configuration of a node and stores it on the
_nodos/node-name_ directory.

Se puede correr varias veces con diferentes nombres de nodo para tener
configuraciones separadas (un sólo host, varios nodos) o unidas (un nodo
para cada host local o remoto).

You can run it several times using different node names so you can have
separate configurations (single host, several nodes) or united (a node
per local or remote host).

For instance, embedded devices may not support _lvpn_, but from a
GNU/Linux system you can generate the config and push it to the
correspondent host (Android phone or tablet, OpenWrt router, etc.)

_IMPORTANT_: The default host configuration allows discovery of nodes in
the local network, and also indirect connections to you.  This means if
you want your node to only allow connections to and from nodes you
explicitly allowed or not to forward data between nodes, you'll have to
set this options to "no" and also add "DirectOnly = yes" to your
_tinc.conf_ file.


# EXAMPLES

## Basic config with a single connection

  lvpn init -c trululu guachiguau

## Generate and install basic config with a single connection

  lvpn init -i -a guachiguau.org -c trululu guachiguau

## Create a node with a given IP address

  lvpn init -l 192.168.9.202/32 guachiguau

## Create a node that reaches other subnets

  lvpn init -r guachiguau

## Create a node that reaches other subnets and routes one

  lvpn init -r -s 10.4.23.224/27 guachiguau

## Create an Android node

Requires [Tinc GUI for Android](http://tinc_gui.poirsouille.org/)

  lvpn init -A -c ponape rapanui
