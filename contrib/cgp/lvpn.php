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
$obj->ds_names = array('nodes' => 'Nodos totales');
$obj->colors = array('nodes' => 'ff0000');

$obj->rrd_title = 'LibreVPN';
$obj->rrd_vertical = 'Nodos';
$obj->rrd_format = '%.2lf';

collectd_flush($obj->identifiers);
$obj->rrd_graph();
