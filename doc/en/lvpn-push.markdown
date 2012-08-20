# Syncs config files to another host

This command allows you to install or update a node on a remote system. It's
meant to work with embedded nodes, such as OpenWRT flashed routers.

It requires SSH access.

Usage:
lvpn push nodo user@host [tinc dir]

Examples:

* Sync a node
  lvpn push guachiguau root@10.4.23.225
