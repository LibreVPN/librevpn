% LVPN-ADD-SUBNET(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

_lvpn add-subnet_ adds an IP address to a node


# SYNOPSIS

_lvpn add-subnet_ [-hvg] -[4|6] [local-node] [address]


# OPTIONS

-h
:    This message

-v
:    Verbose mode, informs everything

-g
:    Generate the IP address instead of waiting for a manually assigned
     one.  This is the default behavior if nothing is specified.

-4
:    Generate an IPv4 address

-6
:    Generate an IPv6 address.  This is the default behavior.


# DESCRIPTION

Adds or generates an IP address to the specified host file.  It can be
either an IPv4 (with _-4_) or an IPv6 (with _-6_) address.

Useful for migrating to IPv6.

This command guesses the node's name from the $HOSTNAME if none is
specified.


# EXAMPLES

## Generate and add an IPv6 to the local node

_lvpn add-subnet_ -v
