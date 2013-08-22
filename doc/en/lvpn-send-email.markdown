% LVPN-SEND-EMAIL(1) Manual de LibreVPN | lvpn
% fauno <fauno@endefensadelsl.org>
% 2013

# NAME

Sends the host file by email

-h
:    This message

-t
:    Destinataion, default is vpn@hackcoop.com.ar

-f
:    From field, default is git user or user@hostname

-s
:    Alternate subject

-m
:    Alternate message


## Env vars

SENDMAIL
:    Alternate sendmail


# DESCRIPTION

Generates an email with the host file and sends it.

Requires _sendmail_ or compatible to be configured in the system.

# SEE ALSO

_sendmail(1)_
