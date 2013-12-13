% LVPN-INSTALL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Installs or synchronizes a node on the system.


# SYNOPSIS

_lvpn install_ [-hvdn] local-node


# OPTIONS

-h
:    This message

-v
:    Verbose mode

-r
:    Remove extra files, pristine copy of _nodos/local-node_.  It was
     _-d_ but this flag is now reserved for debugging.

-n
:    Dry-run, use it with _-v_.


# DESCRIPTION

Syncs  _nodos/local-node_ to _/etc/tinc/lvpn_.

It's required to run it after any change on the config.

Also, it configures the system to run the VPN after reboot, and if
NetworkManager is used, automatic reconnection after a succesful
connection.

If the package providing _nss-mdns_ is installed, edits
_/etc/nsswitch.conf_ so it can solve .local addresses.


# SEE ALSO

_rsync(1)_
