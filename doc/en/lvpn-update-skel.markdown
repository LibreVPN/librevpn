% LVPN-UPDATE-SKEL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Upgrades skel files


# SYNOPSIS

_lvpn update-skel_ [-v] node1 [node2 ...]


# OPTIONS

-v
:    Verbose mode


# DESCRIPTION

The _lvpn_ skel includes init and self-configuration scripts (_tinc-up_,
etc.).  This command upgrades the scripts on the specified nodes.

If the files already exist, they're saved as _.backup_.
