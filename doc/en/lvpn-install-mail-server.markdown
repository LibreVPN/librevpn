% LVPN-INSTALL-MAIL-SERVER(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

_lvpn install-mail-server_ installs a local mailserver for email
exchange from node to node.


# SYNOPSIS

_lvpn install-mail-server_ [-h] [-f] [-p /etc/postfix] local-node


# DESCRIPTION

Install a _postfix_ configuration suited for email exchange between
nodes using local addresses in the form _user@node.local_.  It can also
route email to Internet via a SMTP gateway that knows how to translate
addresses.


# OPTIONS

-h
:    This message

-f
:    Force installation.  It will replace your actual postfix config!

-p /etc/postfix
:    Install configuration on another path.


# SEE ALSO

_postfix(1)_ _postmap(1)_ _transport(5)_
