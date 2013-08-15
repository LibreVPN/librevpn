% LVPN-CONNECTTO(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Connect to other nodes


# SYNOPSIS

_lvpn connectto_ local-node [nodo-remoto nodo-remoto2...]


# DESCRIPTION

Configures the local node to connecto to the specified remote nodes.  To
join a tinc network, you have to copy the host file for the remote node
on your hosts/ directory and add the _ConnectTo = remote-node_ line on
your _tinc.conf_.  This script automatizes this step.

The remote nodes must run the _lvpn add-host_ command for the local
node.


# EXAMPLES

## List nodes to which noanoa connects to

    lvpn connectto noanoa

## Add ponape and medieval to noanoa

    lvpn connectto noanoa ponape medieval


# SEE ALSO

_tinc.conf(5)_, _lvpn-add-host(1)_
