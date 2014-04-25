% LVPN-D3(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Export links and nodes to a d3js force graph.


# SYNOPSIS

lvpn d3 > data.json


# DESCRIPTION

Extracts known nodes and links from the tincd log and prints them in
JSON format for D3.

Tincd must be started with *--logfile*.
