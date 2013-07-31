PREFIX?= /usr/local
# Agregar otros directorios acá para incluir natpmp, etc.
DIRS=etc/generate-ipv6-address-0.1
#DIRS+= etc/libnatpmp etc/miniupnp/miniupnpc

# Nombre de la red
NETWORK?= lvpn

# Si estamos empaquetando, definir el directorio de compilación
TARGET?=

LIBDIR?= $(PREFIX)/lib/$(NETWORK)
DOC?= $(PREFIX)/share/$(NETWORK)/doc
HOSTS?= $(PREFIX)/share/$(NETWORK)/hosts
BEADLE?= $(PREFIX)/share/$(NETWORK)/beadle
# La configuración de tinc
TINC?= /etc/tinc/$(NETWORK)
# `lvpn`
LVPN?= $(PREFIX)/bin/$(NETWORK)

# Flags por defecto para el daemon
FLAGS?= --logfile -U nobody
# Tamaño de las llaves
KEYSIZE?= 4096
# Puerto por defecto
PORT?= 655

# Las subredes
SUBNET?= 192.168.9.0/24
SUBNET6?= 2001:1291:200:83ab::/64

# Gettext
TEXTDOMAINDIR?= $(PREFIX)/share/locale
TEXTDOMAIN?= $(NETWORK)

# Encontrar dinámicamente todos los .in
SOURCES=$(wildcard *.in **/*.in)
OBJECTS=$(patsubst %.in,%.out,$(SOURCES))
DOC=$(wildcard doc/**/*.markdown)
MAN=$(patsubst %.markdown,%.1,$(DOC))

all: $(OBJECTS) $(DIRS)

# Compilar los etc/
.PHONY: $(DIRS)
$(DIRS):
	$(MAKE) -C $@

# Reemplazar todas las variables en los .in y pasarlas a los .out
$(OBJECTS):
	sed -e "s/@NETWORK@/$(NETWORK)/g" \
      -e "s,@LIBDIR@,$(LIBDIR),g" \
			-e "s,@DOC@,$(DOC),g" \
			-e "s,@HOSTS@,$(HOSTS),g" \
			-e "s,@BEADLE@,$(BEADLE),g" \
			-e "s,@TINC@,$(TINC),g" \
			-e "s,@LVPN@,$(LVPN),g" \
			-e "s/@FLAGS@/$(FLAGS)/g" \
			-e "s/@KEYSIZE@/$(KEYSIZE)/g" \
			-e "s/@PORT@/$(PORT)/g" \
			-e "s,@SUBNET@,$(SUBNET),g" \
			-e "s,@SUBNET6@,$(SUBNET6),g" \
			-e "s,@TEXTDOMAINDIR@,$(TEXTDOMAINDIR),g" \
			-e "s/@TEXTDOMAIN@/$(TEXTDOMAIN)/g" \
			$(patsubst %.out,%.in,$@) > $@

# Generar los manuales
$(MAN):
	pandoc --standalone \
	       --output="$@" \
				 --to=man \
				 $(patsubst %.1,%.markdown,$@)

man: $(MAN)

install: all
	mkdir -p $(TARGET)$(PREFIX)/bin \
	         $(TARGET)$(LIBDIR) \
	         $(TARGET)$(DOC) \
	         $(TARGET)$(HOSTS) \
	         $(TARGET)$(BEADLE) \
	         $(TARGET)$(TEXTDOMAINDIR)/$(TEXTDOMAIN)

	cp    hosts/* $(TARGET)$(HOSTS)/
	cp -r lib/* $(TARGET)$(LIBDIR)/
	cp -r doc/* $(TARGET)$(DOC)/

# TODO instalar automáticamente los .out en sus destinos
	install -D -m755 lvpn.out $(TARGET)$(PREFIX)/bin/lvpn

## TODO encontrar los bundled automáticamente
	test -f etc/generate-ipv6-address-0.1/`uname -m`-generate-ipv6-address && \
	install -m755 etc/generate-ipv6-address-0.1/`uname -m`-generate-ipv6-address \
	              $(TARGET)$(PREFIX)/bin/generate-ipv6-address

# Opcional
	-test -f etc/libnatpmp/natpmpc-shared && \
	install -m755 etc/libnatpmp/natpmpc-shared \
	              $(TARGET)$(PREFIX)/bin/natpmpc

# Opcional
	-test -f etc/miniupnp/miniupnpc/upnpc-shared && \
	install -m755 etc/miniupnp/miniupnpc/upnpc-shared \
	              $(TARGET)$(PREFIX)/bin/upnpc
##

clean:
	rm -rf $(OBJECTS)

man-clean:
	rm -rf $(MAN)
