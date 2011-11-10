#!/usr/bin/env ruby

begin
    require 'graphviz'
rescue
    puts 'Este script necesita ruby-graphviz para funcionar'
    exit 1
end

# Encontrar los nodos y sus uniones
re_nodes = /(\w+) to (\w+)/

# Encontrar las conexiones en la red
re_log   = /([0-9\-: ]+).*Edges:(.*)End of edges./m

# Pedirle a tincd que imprima toda la red
# Necesita iniciarse con los flags --logfile -U nobody
`sudo -u nobody killall -SIGUSR2 tincd`

# Salir si no se pudo enviar la señal
exit 1 if $?.to_i > 0

# Leer el log buscando la lista de edges
log = IO::read('/var/log/tinc.lab.log').scan(re_log).to_s

# Crear el grafico
g = GraphViz::new('structs', 'type' => 'digraph')

# Estilo
g.node[:fontname] = 'DejaVu Sans'
g.node[:fontsize] = '12'
g.node[:style] = 'filled'
g.node[:fillcolor] = '#b3e86a'

# Buscar todas las uniones
log.scan(re_nodes) do |n|

# Agregar el nodo
    g.add_node(n[0])

# Agregar la conexión
    g.add_edge(n[0], n[1])
    
end

# Salida
g.output(:png => '/tmp/graph.png')
g.output(:dot => nil)
puts '// El grafico se guardo en /tmp/graph.png'
