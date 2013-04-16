# LibreVPN

  -h Esta ayuda
  -c Lista de comandos

## Cómo empiezo?

Leyendo el sitio http://librevpn.org.ar o la ayuda de `lvpn init` :)

## Donde está mi nodo?

El comando `lvpn init` crea tu nodo dentro del directorio _nodos/_.  Podés
tener varios nodos pero instalar uno por sistema (usando `lvpn install
tunodo`). 

Cualquier comando que aplique cambios en tu nodo, debe instalarse luego usando
el comando `lvpn install tunodo`.

## Uso

  lvpn comando -opciones parametros

Consultar la ayuda de cada comando usando la opción -h luego del nombre de
comando:

	lvpn add-host -h
