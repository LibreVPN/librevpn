-- Agregar a prosody.cfg.lua

VirtualHost "{{node}}.lab"
    admins { '{{jid}}' }
    enabled = true


