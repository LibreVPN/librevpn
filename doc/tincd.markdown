# Tinc VPN

## Flags

Las flags recomendadas para correr `tincd` son:

### Seguridad

* '-U nobody', no correr con privilegios de root
* '-R', chroot al directorio de configuración
* '-L', poner tincd en memoria protegida

### Log

* '--logfile' crea /var/log/tinc.vpn.log
  > Esta flag es requerido para correr bin/graph
* '-d 1' informa las conexiones
