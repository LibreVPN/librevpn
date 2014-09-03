# Correo entre nodos de LibreVPN

Copiá el archivo main.cf en este directorio a `/etc/postfix` o adaptalo
a tu configuración actual.

Lo importante es cambiar el valor de `myhostname` por el nombre de tu
nodo.local, lo que va a ser el @nodo.local de tu cuenta normal.

Por ejemplo para fauno en naven.local, la dirección de correo va a ser
`fauno@naven.local`.

Los correos recibidos se guardan en `~/Maildir` para cambiar esto,
adapta la variable `home_mailbox`.


# Email between LibreVPN nodes

Copy `main.cf` inside `/etc/postfix` or adapt it to your actual config.

You need to change the `myhostname` variable to the name of your
node.local, which is going to be your @node.local address.

For instance, fauno on naven.local would have `fauno@naven.local` as his
address.

Email will be saved on `~/Maildir`.  To change this, adapt the
`home_mailbox` var.
