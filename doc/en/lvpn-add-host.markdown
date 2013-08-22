% LVPN-ADD-HOST(1) Manual de LibreVPN | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

lvpn add-host adds a node to known nodes


# SYNOPSIS

lvpn add-host [-hfu] local-node remote-node [remote-node2 ...]


# DESCRIPTION

For a node to connect to another, the latter must "recognize" it by
adding it's host file.

For instance, if the _ponape_ node has a "ConnectTo = medieval" line in
it's _tinc.conf_ file, for _medieval_ to recognize it, it must add
_ponape_'s host file in it's node dir.

The `-u` flag updates the already recognized nodes.


# OPTIONS

-h
:    This message

-u
:    Update host files

-f
:    Replace if already exists


# EXAMPLES

## Add haiti and noanoa to ponape

_lvpn add-host_ ponape haiti noanoa


## Update nodes

_lvpn add-host_ -u ponape
