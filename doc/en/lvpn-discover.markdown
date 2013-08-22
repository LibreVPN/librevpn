% LVPN-DISCOVER(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Discover nodes in the local network using Avahi and optionally adds
them.


# SYNOPSIS

_lvpn discover_ [-h] [-i if|-A] [-a|-c] [-f] [-b] local-node [nodo-remoto]


# OPTIONS

-h
:    This message

-i
:    Filter by network interface

-a
:    Add nodes, recognize them.  Downloads the host file and adds it
     using _lvpn add-host_.

-c
:    Connect to the nodes (implies -a).  After running _-a_, connect to
     the nodes using _lvpn connectto_.

-f
:    Trust keys on the network rather than local copies.  When you
     already have the host file, this copy is used.  With this option
     the host is always downloaded.

-A
:    Use any interface (VPN included, don't use with _-c_!)

-b
:    Uses beadle (?)


# DESCRIPTION

Facilitates host file exchange in a local network.

Used with _lvpn announce_ to discover nodes on the local network.

For security, if the host file already exists, this file is used.
With _-f_ host file is always downloaded.


# EXAMPLES

## Lists nodes discovered on the LAN

lvpn discover

## List all discovered nodes, even in the VPN

  lvpn discover -A

## Add discovered nodes to ponape

  lvpn discover -a ponape

## Ponape connects to all nodes

  lvpn discover -c ponape

## Trust the local network for all host files

  lvpn discover -f -c ponape

## Only search on one interface

  lvpn discover -i eth0 -c ponape

## Connect to all announced nodes (warning!)

  lvpn discover -c ponape -A

## Connects using beadle

  lvpn discover -b ponape nuevo-nodo
