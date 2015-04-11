% LVPN-CREATE-KEYNODE(1) LibreVPN Manual | LibreVPN
% fauno <fauno@endefensadelsl.org>
% 2015

# NAME

lvpn create-keynode creates a key node


# SYNOPSIS

lvpn create-keynode [-h] [-p port] [-c hosts.git] [-k lvpn-keynode] local-node


# DESCRIPTION

Configures and starts a keynode.  A keynode holds a git repository of
node files, and allows everyone on the VPN to push and pull changes.

The keynode is a sshd(8) server running on a special port and allowing
unauthenticated connections from the VPN.  In this way changes
can only come from the network itself.

This script configures a ssh chroot for the lvpn-keynode user and only
allows git pull and push via git-shell(1).  Subsequent runs will repair
the chroot and sshd's config file (an alternate one just for the
keynode) and restart sshd if needed.


# OPTIONS

-h
:    This message

-p port
:    Alternate port number.  Default is 490001.

-c
:    Clone hosts.git from this git URL.

-k lvpn-keynode
:    User name for the keynode. Default is lvpn-keynode.


# EXAMPLES

## Configure and start the keynode on ponape

_lvpn create-keynode_ ponape

## Restart the keynode on ponape

_lvpn create-keynode_ ponape


# SEE ALSO

_sshd(8)_ _git-shell(1)_
