% LVPN-TEST-NODE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NAME

Tests connection to a node


# SYNOPSIS

_lvpn test-node_ [-hv] local-node node


# OPTIONS

-h
:    This message

-v
:    Show tests


# DESCRIPTION

Tests if it's possible to connect from **local-node** to **node**.

Performs a connection test to **node**.  Error can be temporary if
**node** is unavailable.

Returns **0** on success, **1** on error.


# EXAMPLES

## Test connection from yap to ponape

lvpn test-node yap ponape ; echo $?

## Test connection and show messages

lvpn test-node -v yap ponape


# SEE ALSO

_lvpn-rotate-nodes(1)_ _nc_
