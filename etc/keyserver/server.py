#!/user/bin/env python2
#-*- coding: utf8 -*-

from bottle import *
import os
import re
import sys

HOSTS = os.environ.get('LVPN_HOSTS') + '/'
LVPN = os.environ.get('LVPN')

@post('/<hostname>')
def submit_key(hostname):
	""" Hostname es el nombre del fichero, el contendo son los datos enviados
	vía POST """
	if not re.match(r'^[a-zA-Z0-9_\-]+', hostname):
		# Contiene caracteres especiales como / o ..
		return 'FILTER'
	filename = HOSTS + hostname

	if os.path.exists(filename):
		return 'FILE EXISTS'

	#Generamos el fichero
	content = request.body.read() # Datos recibidos vía POST
	f = open(filename, 'w')
	f.write(content)
	f.close()

	#Anunciamos la llave
	os.system('%s announce %s' % (LVPN, hostname))

	return 'OK'

run(host='localhost', port=8080, debug=False)

