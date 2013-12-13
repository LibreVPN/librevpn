% LVPN-INSTALL-SCRIPT(1) LibreVPN Manual | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

lvpn install-script install a script thats executed during VPN events.


# SYNOPSIS

lvpn install-script [-hves] local-node event script


# DESCRIPTION

Installs scripts to be executed on VPN events.  At the moment, `tincd`
only supports two kinds of events after the VPN starts, when a node
connects or disconnects, or when a subnet is announced or dis-announced.


# OPTIONS

-h
:    This message

-v
:    Verbose mode

-e
:    List available events

-s
:    List available scripts


# EVENTS

tinc
:    This event triggers when the VPN starts/stops.  Put scripts that
     should run once here.

host
:    Run this script when a node (dis)connects.

subnet
:    Run this script when a subnet becomes (un)reachable


# SCRIPTS

debug
:    Debug events

notify
:    Show a notification using D-Bus.  **It doesn't work** because D-Bus
     doesn't allow users to send notification to another user's session.

ipv6-router
:    Set this node as an IPv6 router/gateway.

ipv6-default-route
:    Set this node's IPv6 default route.

port-forwarding
:    Asks the default router to open up the ports, using NAT-PMP and
UPnP


# EXAMPLES

## Notify when a host (dis)connects

_lvpn install-script_ ponape host notify


# SEE ALSO

_tinc.conf(5)_
