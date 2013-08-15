% LVPN\_TINCD(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

LibreVPN

# OPTIONS

Recommended flags to run _tincd_:

### Security

-U nobody
:    Root privileges are dropped

-R
:    Chroots to the config dir

-L
:    Put tincd in protected memory.  This option protects the encryption
     keys but it makes tincd unstabled.  Use with precaution.


### Log

--logfile
:    Logs to /var/log/tinc.vpn.log

-d 1
:    Logs connections


# SEE ALSO

_tincd(8)_
