<?php
# Collectd LibreVPN plugin
# 
# Plugin para Collectd Graph Panel
# http://pommi.nethuis.nl/category/cgp/
#
# Copiar al directorio plugin/

require_once 'conf/common.inc.php';
require_once 'type/Default.class.php';
require_once 'inc/collectd.inc.php';

## LAYOUT
# lvpn/gauge-nodes.rrd

$obj = new Type_Default($CONFIG);
$obj->data_sources = array('value');
$obj->ds_names = array(
  'nodes' => 'Total',
  'unknown-peers' => 'Desconocidos'
  );
$obj->colors = array(
  'nodes' => 'ff0000',
  'unknown-peers' => '00ff00');

$obj->rrd_title = 'LibreVPN';
$obj->rrd_vertical = 'Nodos';
$obj->rrd_format = '%.0lf';

collectd_flush($obj->identifiers);
$obj->rrd_graph();
