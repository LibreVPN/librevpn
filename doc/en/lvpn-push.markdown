% LVPN-PUSH(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Push a node to a remote host


# SYNOPSIS

_lvpn push_ nodo user@host [remote tinc dir]


# DESCRIPTION

This command allows to install or update a node on a remote host.  It's
designed to work with embedded systems, like OpenWrts routers.

Requires SSH access.


# EXAMPLES

## Sync a node

_lvpn push_ guachiguau root@10.4.23.225
