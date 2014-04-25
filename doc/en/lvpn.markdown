% LVPN(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

LibreVPN

## SYNOPSIS

  lvpn command -options parameters


# OPTIONS

-h
:    This message

-c
:    Available commands

-d
:    Debug mode.  Use this flag to enable command debug.


# DESCRIPTION

## How do I start?

By reading http://librevpn.org.ar o _lvpn init_'s help :)

## Where's my node?

The _lvpn init_ command creates your node on the _nodos/_ directory if
running _lvpn_ from the development clone, or to _~/.config/lvpn/nodos_
if installed on system.

You can have several nodes but only one per host can be installed (using
_lvpn install your-node_).

Any command that makes changes on the local node must be installed
afterwards using the _lvpn install local-node_ command.

All command's help can be queried using the _-h_ flag after the command
name:

	lvpn add-host -h


# SEE ALSO

_lvpn-init(1)_
