# Correo entre nodos de LibreVPN

Copiá los archivos main.cf y transport en este directorio a
`/etc/postfix` o adaptalos a tu configuración actual.

Lo importante es cambiar el valor de `myhostname` por el nombre de tu
nodo.local, lo que va a ser el @nodo.local de tu cuenta normal.  Lo
mismo para transport.

> Nota: buscá los valores para cambiar entre {{llaves}}, por ejemplo en
> transport y main.cf está la variable {{node}} que tenés que cambiar
> por el nombre de tu nodo

Por ejemplo para fauno en naven.local, la dirección de correo va a ser
`fauno@naven.local`.

Los correos recibidos se guardan en `~/Maildir` para cambiar esto,
adapta la variable `home_mailbox`.

Además, para que postfix reconozca el archivo transport, hay que
ejecutar `postmap /etc/postfix/transport` cada vez que se lo modifica.


# Email between LibreVPN nodes

Copy `main.cf` and `transport` inside `/etc/postfix` or adapt them to
your actual config.

You need to change the `myhostname` variable to the name of your
node.local, which is going to be your @node.local address.  Also set
your node in transport.

> Note: Look for {{variable}} in both files, ie {{node}}

For instance, fauno on naven.local would have `fauno@naven.local` as his
address.

Email will be saved on `~/Maildir`.  To change this, adapt the
`home_mailbox` var.

Remember to run `postmap /etc/postfix/transport` for postfix to
recognize this file.


# Test

## Artesanal

```

$ echo -e "From: vos@nodo.local\nTo: fauno@yap.local\nSubject: hola\n\nhola!" | sendmail -t

```

## Mail

```

$ mail fauno@yap.local<enter>

Subject: hola

hola<ctrl-d>

```
