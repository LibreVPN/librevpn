% LVPN-TEST-NODE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2015

# NAME

Tests connection to a node


# SYNOPSIS

_lvpn test-node_ [-hvk] local-node node


# OPTIONS

-h
:    This message

-v
:    Show tests

-k
:    Tests if **node** knows **local-node** too.


# DESCRIPTION

Tests if it's possible to connect from **local-node** to **node**.

Performs a connection test to **node**.  Error can be temporary if
**node** is unavailable.

Returns **0** on success, **1** on error.

If the **-k** flag is used, an aditional test is performed to check if
**node** has the host file for **local-node**.  This doesn't mean the
keys will match, but it's a way to know if the connection is possible
without intervention in **node**.


# EXAMPLES

## Test connection from yap to ponape

lvpn test-node yap ponape ; echo $?

## Test connection and show messages

lvpn test-node -v yap ponape

## Test connection between yap and ponape

lvpn test-node -k yap ponape; echo $?


# SEE ALSO

_lvpn-rotate-nodes(1)_ _nc_
