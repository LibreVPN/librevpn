-- Agregar a prosody.cfg.lua

VirtualHost "{{node}}.local"
    admins { '{{jid}}' }
    enabled = true

