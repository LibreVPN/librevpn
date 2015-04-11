% LVPN-ROTATE-NODES(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NAME

Rotates local node's connections to the VPN


# SYNOPSIS

_lvpn rotate-nodes_ [-h] [-n N] local-node


# OPTIONS

-h
:    This message

-n N
:    Connect up to **N** nodes.  Default is **3**.


# DESCRIPTION

Configures **local-node** to connect to a set of random nodes.

It tests the connection to random nodes and configures **local-node** to
connect to them.

This script helps you get a set of connections to the VPN.


# EXAMPLES

## Connects yap to random nodes

lvpn rotate-nodes yap

## Connects yap to ten random nodes

lvpn rotate-nodes -n 10 yap


# SEE ALSO

 _lvpn-create-keynode(1)_ _lvpn-test-node(1)_ _lvpn-add-keynode(1)
