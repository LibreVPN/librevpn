% LVPN-INSTALL-SCRIPT(1) LibreVPN Manual | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

lvpn install-script install a script thats executed during VPN events.


# SYNOPSIS

lvpn install-script [-hves] local-node event script


# DESCRIPTION

Installs scripts to be executed on VPN events.  At the moment, `tincd`
only supports two kinds of events, when a node connects or disconnects,
or when a subnet is announced or dis-announced.


# OPTIONS

-h
:    This message

-v
:    Verbose mode

-e
:    List available events

-s
:    List available scripts


# EXAMPLES

## Notify when a host (dis)connects

_lvpn install-script_ ponape host notify

