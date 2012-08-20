# Creates a new node

Nodes are stored on the $LVPN\_DIR/nodos/ directory

    -h  This help
    -v  Verbose
    -i  Install (requires root)
    -f  Force creation
    -p  Port (655)
    -l  IP address on VPN (guessed)
    -s  Announce other subnet(s)
    -r  Add other subnets to route table
    -a  Public address (domain or IP address)
    -c  ConnectTo

Usage: 
lvpn init [-f] [-v] [-p 655] [-l 192.168.9.202/32] [-s 10.4.24.128/27] [-r] [-a dominio.eninternet.tld] [-c otronodo] nodo 

Examples:
* Basic usage with only one connection

  lvpn init -c trululu guachiguau
 
* Create a public node with a connection and install it locally

  lvpn init -i -a guachiguau.org -c trululu guachiguau

* Create a node with a given IP address

  lvpn init -l 192.168.9.202/32 guachiguau

* Create a node that can access other networks

  lvpn init -r guachiguau

* Create a node that acceses other networks and routes its own

  lvpn init -r -s 10.4.23.224/27 guachiguau

