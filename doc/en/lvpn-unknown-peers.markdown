% LVPN-UNKNOWN-PEERS(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Lists unknown peers


# SYNOPSIS

_lvpn unknown-peers_ [/var/log/tinc.lvpn.log]


# OPTIONS

-h
:    This message

-c
:    Count failed connection attempts.  Shows a numeric summary of the
     failed connections.


# DESCRIPTION

Searchs the logfile for nodes which connection attempts are denied
because their host files aren't available.

Tincd must be started with _--logfile__.

Useful with _lvpn add-host_


# SEE ALSO

_lvpn-add-host(1)_
