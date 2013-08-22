% LVPN-ANNOUNCE(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

_lvpn announce_ announce a key on the LAN using Avahi.


# SYNOPSIS

_lvpn announce_ [-h] [-sp] local-node


# DESCRIPTION

Facilitates key exchange on a local network by announcing the local host
file on mDNS.  Use it with _lvpn discover_.


# OPTIONS

-h
:    This message

-s
:    Stop announcing.  With _-p_, removes the _lvpn.service_ file,
     otherwise it stops _avahi-publish_.

-p
:    Announce permanently (requires root).  Installs _lvpn.service_ so
     that _avahi-daemon_ announces the host key every time the service
     is started.

# EXAMPLES

## Announce a node

  lvpn announce noanoa


## Announce a node permanently

  lvpn announce -p noanoa

Installs the _noanoa_ host file on /etc/avahi/services/lvpn.service.


## Announce keys on beadle (?)

  lvpn announce -b amigo


## Stop announcement

  lvpn announce -s

Stops _avahi-publish_ on this session.


## Stop announcement permanently

  lvpn announce -sp


# SEE ALSO

_avahi.service(5)_, _avahi-publish(1)_, _lvpn-discover(1)_
